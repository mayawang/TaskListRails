# Task List Rails ✅
LIVE heroku app: https://tasks-done.herokuapp.com/

### What went well:
1.Rebuilt wave1-wave3 on Friday because all files lost;
2.Used check-box for editing completion status;
3.Designed Completed time logic in model to reflect task completion time;
4.Added cross-through effect for completed task;
5.Applied RESTful conventions to both views path and HTTP verb;
6.Used render to DRY new and show views;
7.Clean and minimalism UI/UX design.

Making the completed time logic in model work with check-box and new task link, reflecting task completion time, is the most challenging and interesting part for me. I learnt a lot from completing it, especially understanding more when to put the time logic in model. 

Adding cross-though effect is nice too.

### What are you still working on understanding better:
I only managed to adjust the **size** of description text_field. 
I did not figure out a way to adjust text_field's **row and column** for better input experience, and really hope to know how to do so.

Our trio team(Jessica, Leah and I) also agreed that it is difficult to manipulate the form_for form and button. I did not try to adjust the size of the button though. I feel frustration for the row and column of the form_for form.


### What did your chair pair do differently:
Leah changed the completion button to two-ways, which improved user experience a lot. I wasn't think about that other than using check_box. I did not use check_box because the requirement specified using button. It was great to do it this way.
Jessica used great font called Kranky, emoji and Mission impossible theme making it very pretty. 

---

# Project Guide

We are going to build a Task List in Rails. This web application will enable us to keep track of list of tasks with the functionality to add, edit and remove tasks from a list.

Tracking tasks in a web app will let us focus on following Rails conventions and learning how data flows through a Rails application.

## Baseline
**Once you've achieved this baseline, take a walk around the room and see if you can answer questions or help other folks.**

- Start with our standard Github setup (fork this repo and clone to your machine)
- Create a Rails application
  - Create a controller for your `Tasks`
  - Conform to Rails conventions on naming and inflection
- Create a `Task` model and migration.
  - Create the database schema and tables with `rake db:migrate`
  - The `Task` model should include _at least_ the keys indicated below

Tinker with your Model in the `rails console` in order to ensure you have created your model and can interact with it as expected.

## Task Data Requirements

Each task record will include all of the following. Optional in this context means that the user may choose not to provide this information, but it is still required for your schema:
- Self-incrementing identifier (ID)
- title: the title of the task
- description: details about the task
- completed_at: the time and date the task was completed

## Wave 1
This wave is where we will introduce the view layer to interact with our application via the browser.

- Set up necessary controller(s) and route(s) that you will need in order to show a task from the database
- Create a root route for your application that directs users to the list of all tasks
  - Each task name in the list should link to a `show` action that will render a new view for the user.
  - The `show` view should include the complete information about the task: name, description, completion status, and completion date/time.
- All markup in all views should have semantic relevance.


 ## Wave 2
In this wave we will add the first set of user interactivity and persistence.

- Be able to create a new task:
  - The home page should contain a link to Add a new task. This will give the user a form to fill out with the appropriate task fields.
  - After the new task is added, the site should take the user back to the home page which displays the full list of tasks. The new task that was just added should be included in the full list of tasks.
- Be able to delete an existing task:
  - Add a route and controller action whose responsibility is deleting a task (RESTful routes)
  - On the home page, add a button or link for each task that will, once clicked...
    1. Ask the user to confirm that they definitely want to delete the task.
    1. Delete the task from the database and redirect the user back to the list of remaining tasks.

## 🌊 Wave 3
In this wave we will extend the interactivity with users, allowing them to edit existing tasks in a couple of different ways. As always, follow _RESTful_ conventions when implementing these features.

- Add the ability for the user to mark a task complete
  - Add a button to the list of tasks on the home page that, when clicked, will mark a task complete.
  - Update the database with the task's completed date
- Add the ability for the user to edit a task's details.
  - Add an `edit` action that renders a form allowing the user to update all the fields of a task.
  - Submitting the form from the `edit` action should _update_ the existing task; not create a new one.
    - Research: ActiveRecord's `update` method.
  - Link to the `edit` action from the task's `show` page.
  - Optional:  DRY up your code by reusing the view code from the `new` functionality
    - Hint: Rendering _partials_ in Rails.
