class CoffeesController < ApplicationController

  def new
    @coffee = Coffee.new()
  end

  def create
    @coffee = Coffee.new(coffee_params)
    @coffee.user = current_user
    if @coffee.save
      flash[:success] = "Coffee saved."
      redirect_to root_path
    else
      flash.now[:error] = "Please fill out required fields."
      render :new
    end
  end

  def coffee_params
    params.require(:coffee).permit(
      :name,
      :roaster,
      :country,
      :process,
      :coffee_type,
      :region,
      :altitude,
      :producer,
      :variety,
      :organic
    )
  end
end
