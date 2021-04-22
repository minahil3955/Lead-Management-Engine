# frozen_string_literal: true

class PhasesController < ApplicationController
  before_action :set_phase, only: %i[show edit update destroy]
  before_action :set_project_lead

  def index
    @phases = @project_lead.phases
  end

  def show; end

  def new
    @phase = @project_lead.phases.new
  end

  def edit; end

  def create
    @phase = @project_lead.phases.new(phase_params)
    return render :new, notice: 'Phase not Saved !' unless @phase.save

    redirect_to project_lead_phases_path, notice: 'Phase was successfully created.'
  end

  def update
    if @phase.update(phase_params)
      respond_to do |format|
        format.html { redirect_to project_lead_phases_url, notice: 'Phase Updated !' }
      end
    else render edit
    end
  end

  def destroy
    if @phase.destroy
      respond_to do |format|
        format.html { redirect_to project_lead_phases_url, notice: 'Phase Deleted !' }
      end
    end
  end

  private

  def set_phase
    @phase = Phase.find(params[:id])
  end

  def phase_params
    params.require(:phase).permit(:name, :due_date, :status, :user_id)
  end

  def set_project_lead
    @project_lead ||= ProjectLead.find(params[:project_lead_id])
  end
end
