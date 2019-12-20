class Api::FoodLabelsController < ApplicationController
  def index
    @food_labels = FoodLabel.all
    render "index.json.jb"
  end

  def create
    @food_label = FoodLabel.new(
      edible_id: params[:edible_id],
      ingredient_id: params[:ingredient_id],
    )
    @food_label.save
    render "show.json.jb"
  end

  def show
    @food_label = FoodLabel.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @food_label = FoodLabel.find_by(id: params[:id])
    @food_label.edible_id = params[:edible_id] || @food_label.edible_id
    @food_label.ingredient_id = params[:ingredient_id] || @food_label.ingredient_id
    @food_label.save
    render "show.json.jb"
  end

  def destroy
    @food_label = FoodLabel.find_by(id: params[:id])
    @food_label.destroy
    render json: { message: "Food Label has been deleted!" }
  end
end
