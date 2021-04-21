class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @project_leads = ProjectLead.close
  end
end
