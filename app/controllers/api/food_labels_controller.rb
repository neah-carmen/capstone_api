class Api::FoodLabelsController < ApplicationController
  def index
    render json: { message: "index action" }
  end

  def create
    render json: { message: "create action" }
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
