class Api::EdiblesController < ApplicationController
  def index
    @edibles = Edible.all
    render "index.json.jb"
  end

  def create
    @edible = Edible.new(
      name: params[:name],
      upc: params[:upc],
    )
    @edible.save
    render "show.json.jb"
  end

  def show
    render json: { message: "show" }
  end

  def update
    render json: { message: "updated" }
  end

  def destroy
    render json: { message: "destroyed" }
  end
end
