# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "test@email.com", password: "password")
User.create(email: "user@email.com", password: "password")

Ingredient.create(name: "High Fructose Corn Syrup")
Ingredient.create(name: "Turbinado Sugar")
Ingredient.create(name: "Modified Corn Starch")
Ingredient.create(name: "Sugar")
Ingredient.create(name: "Invert Sugar")
Ingredient.create(name: "Corn Syurp")
Ingredient.create(name: "Tartaric Acid")
Ingredient.create(name: "Citric Acid")
Ingredient.create(name: "Natural and Artificial Favors")
Ingredient.create(name: "Yellow 6")
Ingredient.create(name: "Red 40")
Ingredient.create(name: "Yellow 5")
Ingredient.create(name: "Blue 1")

Edible.create(name: "Top Ramen Soy Flavor", upc: "038678561125", user_id: "2")
Edible.create(name: "Sour Patch Kids", upc: "038678561126", user_id: "2")
Edible.create(name: "Pemmican Peppered Beef Jerky", upc: "038678561127", user_id: "2")
Edible.create(name: "Sour Punch Straws", upc: "038678561128", user_id: "2")
Edible.create(name: "Updated fake food", upc: "038678561130", user_id: "2")

FoodLabel.create(edible_id: 2, ingredient_id: 4)
FoodLabel.create(edible_id: 2, ingredient_id: 5)
FoodLabel.create(edible_id: 2, ingredient_id: 6)
FoodLabel.create(edible_id: 2, ingredient_id: 7)
FoodLabel.create(edible_id: 2, ingredient_id: 8)
FoodLabel.create(edible_id: 2, ingredient_id: 9)
FoodLabel.create(edible_id: 2, ingredient_id: 10)
FoodLabel.create(edible_id: 2, ingredient_id: 11)
FoodLabel.create(edible_id: 2, ingredient_id: 12)
FoodLabel.create(edible_id: 2, ingredient_id: 13)
