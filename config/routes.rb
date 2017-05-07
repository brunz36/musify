Rails.application.routes.draw do
  get 'pages/landing'

  root 'pages#landing'

  # namespace :api do
  #   namespace :v1 do
  #     resources :artists do
  #       resources :albums
  #     end
  #   end
  # end

  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
