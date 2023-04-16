Rails.application.routes.draw do
  resources :links, only: [:index, :show, :create]
  root "links#index"
  get "/:short_url" => "links#redirect_to_original_url"
end