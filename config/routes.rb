Rails.application.routes.draw do
  resources :links, only: [:index, :show]
  root "links#index"
  post '/links', to: 'links#create', as: :create_links
end