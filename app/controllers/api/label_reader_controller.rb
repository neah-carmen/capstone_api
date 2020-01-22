class Api::LabelReaderController < ApplicationController
  require "rtesseract"

  def show
    response = Cloudinary::Uploader.upload(params[:image])
    @cloudinary_url = response["secure_url"]
    new_scan = RTesseract.new(@cloudinary_url)

    label_extract = new_scan.to_s
    label_extract = label_extract[13..-1]

    @label_lines = []
    @ingredients_extract = []
    @ingredients = []

    label_extract.split("\n").each do |line|
      @label_lines << line
    end
    @label_lines.delete("\f")

    label_extract.split(/\s*([,;\r\n]+|\s\s)\s*/).each do |ingredient|
      @ingredients_extract << ingredient
    end
    @ingredients_extract.delete(",")
    @ingredients_extract.delete("\n")
    @ingredients_extract.delete(",\n")

    @ingredients_extract.each do |ingredient_name|
      ingredient = Ingredient.where("lower(name) = ?", ingredient_name.downcase).first
      if ingredient
        @ingredients << { name: ingredient.name, is_vegan: ingredient.is_vegan, is_vegetarian: ingredient.is_vegetarian }
      else
        @ingredients << { name: ingredient_name, is_vegan: nil, is_vegetarian: nil }
      end
    end

    render "show.json.jb"
  end
end
