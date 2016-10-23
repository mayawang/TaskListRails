class SessionsController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
  end

  def destroy
    session[:user_id] = nil
    # do not delete user from database(that has logged out).
    # so that when this user login again, it will be mapped to the
    # same User object
    redirect_to root_path
  end

  def create

    env_hash = request.env()
    auth_hash =  env_hash['omniauth.auth']

    if ! auth_hash['uid']
      flash[:notice] = "login Failed!"
      return redirect_to root_path
    end

    # github info does not update new information about user. Need to do something to make website  check updated github info everytime it logs in.
   @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
   if @user.nil?
     # User doesn't match anything in the DB.
     # Attempt to create a new user.
     @user = User.build_from_github(auth_hash)
     unless @user.save
       flash[:notice] = "Unable to Save the User"
       return redirect_to root_path
     end
   end

   # Save the user ID in the session, initially saved in caches.
   session[:user_id] = @user.id

   flash[:notice] = "Successfully logged in!"
   redirect_to root_path
  end
end
