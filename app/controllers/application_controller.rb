class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized(_exception)
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end
end
