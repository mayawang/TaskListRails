class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  def get_current_user
    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    end
  end

  def index
    get_current_user

  end

  private
    def get_current_user
      @user = User.find_by(id: session[:user_id])
    end
end
