class Api::IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    render "index.json.jb"
  end

  def create
    @ingredient = Ingredient.new(
      name: params[:name],
    )
    if @ingredient.save
      @ingredient.format_params(params[:is_vegetarian], params[:is_vegan])
      render "show.json.jb"
    end
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.name = params[:name] || @ingredient.name
    @ingredient.is_vegetarian = params[:is_vegetarian] || @ingredient.is_vegetarian
    @ingredient.is_vegan = params[:is_vegan] || @ingredient.is_vegan
    if @ingredient.save
      @ingredient.format_params(params[:is_vegetarian], params[:is_vegan])
      render "show.json.jb"
    end
  end

  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.destroy
    render json: { message: "Ingredient has been deleted!" }
  end
end
