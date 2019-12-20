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
    render json: { message: "destroyed" }
  end
end
