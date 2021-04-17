class ProjectLeadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_lead, only: %i[show edit update destroy]

  def index
    @project_leads = ProjectLead.all
  end

  def show
    # ..
  end

  def new
    @project_lead = ProjectLead.new
  end

  def edit
    # ..
  end

  def create
    @project_lead = ProjectLead.new(project_lead_params)

    respond_to do |format|
      if @project_lead.save
        format.html { redirect_to @project_lead, notice: 'Project lead was successfully created.' }
        format.json { render :show, status: :created, location: @project_lead }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_lead.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project_lead.update(project_lead_params)
        format.html { redirect_to @project_lead, notice: 'Project lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_lead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_lead.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_lead.destroy
    respond_to do |format|
      format.html { redirect_to project_leads_url, notice: 'Project lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_project_lead
    @project_lead = ProjectLead.find(params[:id])
  end

  def project_lead_params
    params.require(:project_lead).permit(:user_id, :client_id, :name, :platform, :is_sale, :created_at, :updated_at)
  end
end
