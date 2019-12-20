class Api::IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    render "index.json.jb"
  end

  def create
    @ingredient = Ingredient.new(
      name: params[:name],
    )
    @ingredient.save
    render "show.json.jb"
  end

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    render json: { message: "update action" }
  end

  def destroy
    render json: { message: "destroy action" }
  end
end
