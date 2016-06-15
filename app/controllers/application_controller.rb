class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_supervisor
    unless current_user.supervisor?
      flash[:danger] = t "message.you_are_not_supervisor"
      redirect_to root_path
    end
  end
end
