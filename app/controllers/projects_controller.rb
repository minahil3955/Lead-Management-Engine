# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @project_leads = ProjectLead.close
  end
end
