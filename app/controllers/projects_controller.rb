# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @project_leads = ProjectLead.close.includes(:client)
  end
end
