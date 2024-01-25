Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'uploader/image'
  post 'uploader/image'
  resources :articles
  # Routes pour ActiveStorage
  direct :rails_blob do |blob, options|
    route_for(:rails_blob, blob, options)
  end

  resolve("ActiveStorage::Blob") { |blob| route_for(:rails_blob, blob) }
  resolve("ActiveStorage::Variant") { |variant| route_for(:rails_blob, variant.blob) }
  resolve("ActiveStorage::Preview") { |preview| route_for(:rails_blob, preview.blob) }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
