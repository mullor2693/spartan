class WorkoutsController < ApplicationController
  before_action :set_user_workouts
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # GET /workouts
  # GET /workouts.json
  def index
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = Workout.new(user: current_user)
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = Workout.new(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user_workouts
      @workouts = current_user.workouts 
      redirect_to authenticated_root_path, alert: 'Exercise not found on the system.' if @workouts.nil?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find_by(id: params[:id])
      redirect_to exercises_url, alert: 'Exercise not found on the system.' if @workout.blank? || !@workouts.include?(@workout)
    end

    # Only allow a list of trusted parameters through.
    def workout_params
      params.require(:workout).permit(:name, :description, :training_days, :user_id)
    end
end
