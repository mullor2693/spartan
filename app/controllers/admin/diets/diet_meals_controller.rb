class Admin::Diets::DietMealsController < Admin::Diets::ApplicationController
  before_action :set_diet_diet_meals
  before_action :set_diet_meal, only: [:show, :edit, :update, :destroy]

  # GET /diet_meals/new
  def new
    @diet_meal = @diet_meals.new
  end

  # GET /diet_meals/1/edit
  def edit
  end

  # POST /diet_meals
  # POST /diet_meals.json
  def create
    @diet_meal = @diet_meals.new(diet_meal_params)
    respond_to do |format|
      if @diet_meal.save
        format.html { redirect_to [@diet, @meal, @diet_meal], notice: 'Meal food was successfully created.' }
        format.json { render :show, status: :created, location: [@diet, @meal, @diet_meal] }
      else
        format.html { render :new }
        format.json { render json: @diet_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diet_meals/1
  # PATCH/PUT /diet_meals/1.json
  def update
    respond_to do |format|
      if @diet_meal.update(diet_meal_params)
        format.html { redirect_to [:admin, @diet], notice: 'Meal food was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @diet] }
      else
        format.html { render :edit }
        format.json { render json: @diet_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diet_meals/1
  # DELETE /diet_meals/1.json
  def destroy
    @diet_meal.destroy
    respond_to do |format|
      format.html { redirect_to admin_diet_path(@diet), notice: 'Meal food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diet_diet_meals
      @diet_meals = @diet.diet_meals
    end

    def set_diet_meal
      @diet_meal = @diet_meals.find_by(id: params[:id])
      redirect_to admin_diet_path(@diet), alert: 'La relación no se encuentra en la dieta.' if @diet_meal.blank?
    end

    # Only allow a list of trusted parameters through.
    def diet_meal_params
      params.require(:diet_meal).permit(:food_id, :quantity, :unit)
    end
end
