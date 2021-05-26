class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def edit
  end

  def popularest
    @meals = Meal.most_popular
  end
end
