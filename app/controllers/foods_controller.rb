class FoodsController < ApplicationController
  before_action :set_food, only: [:show]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find_by(id: params[:id])
      redirect_to foods_path, alert: 'Food not found on the system.' if @food.blank?
    end

end
