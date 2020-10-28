class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :none]

  def index
  end

  def none
    redirect_to root_path, alert: "Page doesn't exists."
  end

end
