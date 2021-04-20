# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    super
    redirect_to project_leads_path
  end

  def destroy
    super
  end
end
