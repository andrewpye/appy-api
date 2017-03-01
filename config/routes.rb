Rails.application.routes.draw do
  resources :apps
  resources :users
  resources :image_files, :path => '/image-files'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
