Rails.application.routes.draw do
  root to: "shippings#index"

  resources :shippings do
    collection {post :import}
  end
  
end
