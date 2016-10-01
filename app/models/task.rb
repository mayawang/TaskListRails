class Task < ApplicationRecord
  def is_complete=(value)
    if value
      self.complete_at = Time.now
    else
      self.complete_at = nil
    end
    super(value)
  end
end
