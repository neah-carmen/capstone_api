class Api::EdiblesController < ApplicationController
  before_action :authenticate_user

  def index
    @edibles = Edible.all
    render "index.json.jb"
  end

  def create
    if params[:image].instance_of?(String) #&& params[:image].start_with?("https://res.cloudinary.com")
      cloudinary_url = params[:image]
    else
      response = Cloudinary::Uploader.upload(params[:image])
      cloudinary_url = response["secure_url"]
    end

    @edible = Edible.new(
      name: params[:name],
      upc: params[:upc],
      user_id: current_user.id,
    )
    if @edible.save
      image_url = LabelImage.new(url: cloudinary_url, edible_id: @edible.id)
      image_url.save
      params[:ingredients].zip(params[:is_vegetarian], params[:is_vegan]).each { |ingredient_name, is_vegetarian, is_vegan|
        ingredient = Ingredient.find_or_create_by(name: ingredient_name, is_vegetarian: is_vegetarian, is_vegan: is_vegan)
        if ingredient.save
          food_label = FoodLabel.new(
            edible_id: @edible.id,
            ingredient_id: ingredient.id,
          )
          food_label.save
        end
      }
      @edible.is_vegetarian?
      @edible.is_vegan?
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
    if @edible.save
      @edible.is_vegetarian?
      @edible.is_vegan?
    end
    render "show.json.jb"
  end

  def destroy
    @edible = Edible.find_by(id: params[:id])
    if @edible.destroy
      @edible.food_labels.each do |join_table_data|
        join_table_data.destroy
      end
      @edible.label_images.each do |cloudinary_reference|
        cloudinary_reference.destroy
      end
    end
    render json: { message: "Edible has been deleted!" }
  end
end
