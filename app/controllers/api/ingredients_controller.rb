class Api::IngredientsController < ApplicationController
  def index
    render json: { message: "index action" }
  end

  def create
    @ingredient = Ingredient.new(
      name: params[:name],
    )
    @ingredient.save
    render "show.json.jb"
  end

  def show
    render json: { message: "show action" }
  end

  def update
    render json: { message: "update action" }
  end

  def destroy
    render json: { message: "destroy action" }
  end
end
