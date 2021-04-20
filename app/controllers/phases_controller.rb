class PhasesController < ApplicationController
  before_action :set_phase, only: %i[show edit update destroy]
  before_action :load_user, only: %i[create]

  def index
    @phases = Phase.all
  end

  def show
    @role = Role.Engineer
  end

  def new
    @phase = Phase.new
  end

  def edit
    # ..
  end

  def create
    @phase = Phase.new(phase_params)
    respond_to do |format|
      if @phase.save
        AssigneeMailer.with(user: @user, phase: @phase).assignment_email.deliver_now
        format.html { redirect_to @phase, notice: 'Phase Created Sucessfully !' }
        format.json { render :show, status: :created, location: @phase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to @phase, notice: 'Phase Updated !'}
        format.json { render :show, status: :ok, location: @phase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @phase.destroy
    respond_to do |format|
      format.html { redirect_to phases_url, notice: 'Phase Deleted !' }
      format.json { head :no_content }
    end
  end

  private

  def set_phase
    @phase = Phase.find(params[:id])
  end

  def phase_params
    params.require(:phase).permit(:name, :due_date, :status, :created_at, :updated_at, :project_lead_id)
  end

  def load_user
    @user = User.find(params[:phase][:user_id])
  end
end
