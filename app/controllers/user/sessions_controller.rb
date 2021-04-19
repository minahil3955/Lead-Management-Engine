# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  def create
    super
    redirect_to project_leads_path
  end
end
