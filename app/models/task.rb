class Task < ApplicationRecord
  belongs_to :user, class_name: "User"

  def is_complete=(value)
    if value
      self.complete_at = Time.now
    else
      self.complete_at = nil
    end
    super(value)
  end
end
