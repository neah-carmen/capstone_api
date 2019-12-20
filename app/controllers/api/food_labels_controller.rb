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
    render json: { message: "update action" }
  end

  def destroy
    render json: { message: "destroy action" }
  end
end
