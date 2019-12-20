Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  namespace :api do
    get "/edibles" => "edibles#index"
    post "/edibles" => "edibles#create"
    get "/edibles/:id" => "edibles#show"
    patch "/edibles/:id" => "edibles#update"
    delete "/edibles/:id" => "edibles#destroy"
  end
end
