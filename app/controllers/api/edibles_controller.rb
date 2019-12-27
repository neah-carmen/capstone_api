class Api::EdiblesController < ApplicationController
  before_action :authenticate_user

  def index
    @edibles = Edible.all
    render "index.json.jb"
  end

  def create
    @edible = Edible.new(
      name: params[:name],
      upc: params[:upc],
      user_id: current_user.id,
    )
    if @edible.save
      ingredient = Ingredient.find_or_create_by(name: params[:ingredient_name], is_vegetarian: params[:is_vegetarian], is_vegan: params[:is_vegan])
      if ingredient.save
        food_label = FoodLabel.new(
          edible_id: @edible.id,
          ingredient_id: ingredient.id,
        )
        food_label.save
      end
      render "show.json.jb"
    end
  end

  def show
    @edible = Edible.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @edible = Edible.find_by(id: params[:id])
    @edible.name = params[:name] || @edible.name
    @edible.upc = params[:upc] || @edible.upc
    @edible.save
    render "show.json.jb"
  end

  def destroy
    @edible = Edible.find_by(id: params[:id])
    @edible.destroy
    render json: { message: "Edible has been deleted!" }
  end
end
