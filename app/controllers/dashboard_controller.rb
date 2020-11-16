class DashboardController < ApplicationController
  def index
  end

  def profile
  end

  def physical
    add_breadcrumb "Físico", :physical_path
  end

  def nutrition
    add_breadcrumb "Nutrición", :nutrition_path
  end

  def training
    add_breadcrumb "Entrenamiento", :training_path
  end
end
