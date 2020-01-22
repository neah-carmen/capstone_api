class Api::LabelReaderController < ApplicationController
  require "rtesseract"

  def show
    new_scan = RTesseract.new("https://res.cloudinary.com/neah-dev/image/upload/v1579469493/iz8op9se6py9ppxypqqd.png")
    # response = Cloudinary::Uploader.upload(params[:image])
    # @cloudinary_url = response["secure_url"]
    # new_scan = RTesseract.new(@cloudinary_url)

    label_extract = new_scan.to_s
    label_extract = label_extract[13..-1]

    @display = []
    @ingredients = []

    label_extract.split("\n").each do |line|
      @display << line
    end
    @display.delete("\f")

    label_extract.split(/\s*([,;\r\n]+|\s\s)\s*/).each do |ingredient|
      @ingredients << ingredient
    end
    @ingredients.delete(",")
    @ingredients.delete("\n")
    @ingredients.delete(",\n")

    render "show.json.jb"
  end
end
