class Admin::MealsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_meal, only: %i[ show edit update ]

  def index
    @meals = Meal.all
  end

  def show
    current_week = WeekPeriod.current

    @orders = @meal.orders.in_week_period(current_week)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: "Meal was successfully updated." }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:cut_off_at_day_of_week)
  end
end
