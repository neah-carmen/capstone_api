Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  namespace :api do
    get "/edibles" => "edibles#index"
    post "/edibles" => "edibles#create"
    get "/edibles/:id" => "edibles#show"
    patch "/edibles/:id" => "edibles#update"
    delete "/edibles/:id" => "edibles#destroy"

    get "/ingredients" => "ingredients#index"
    post "/ingredients" => "ingredients#create"
    get "/ingredients/:id" => "ingredients#show"
    patch "/ingredients/:id" => "ingredients#update"
    delete "/ingredients/:id" => "ingredients#destroy"

    get "/food_labels" => "food_labels#index"
    post "/food_labels" => "food_labels#create"
    get "/food_labels/:id" => "food_labels#show"
    patch "/food_labels/:id" => "food_labels#update"
    delete "/food_labels/:id" => "food_labels#destroy"

    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    post "/label_reader" => "label_reader#show"
  end
end
