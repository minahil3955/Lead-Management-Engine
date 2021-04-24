# frozen_string_literal: true

class ProjectLeadsController < ApplicationController
  before_action :set_project_lead, only: %i[show edit update destroy]

  def index
    @project_leads = ProjectLead.open
  end

  def show; end

  def new
    authorize ProjectLead
    @project_lead = current_user.project_leads.new
  end

  def edit; end

  def create
    @project_lead = current_user.project_leads.new(project_lead_params)
    if @project_lead.save
      redirect_to @project_lead, notice: 'Lead successfully created.'
    else render 'new'
    end
  end

  def update
    if @project_lead.update(project_lead_params)
      redirect_to @project_lead, notice: 'Lead updated.'
    else render 'edit'
    end
  end

  def destroy
    if @project_lead.destroy
      redirect_to project_leads_url, notice: 'Lead destroyed.'
    else render 'show'
    end
  end

  private

  def set_project_lead
    @project_lead = ProjectLead.find(params[:id])
    authorize @project_lead
  end

  def project_lead_params
    params.require(:project_lead).permit(:user_id, :client_id, :name, :platform, :sale_status, :created_at, :updated_at)
  end
end
