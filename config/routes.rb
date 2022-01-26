Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Como usuario puedo alquilar libros
  get 'orders', to: 'orders#index'
  get 'orders/new', to: 'orders#new', as: :new_order
  post 'orders', to: 'orders#create'
  resources :books, only: %i[index new show create edit update destroy]
# Como usuario puedo ver los productos disponibles
  # get "books", to: "books#index"
# Como usuario puedo ver los detalles del libro
 # get "books/new", to: "books#new", as: :new_book
  #get "books/:id", to: "books#show", as: :book
# como usuario puedo poner un libro en alquiler

 # post "books", to: "books#create"
# como usuario puedo editar los detalles de mi libro.
  #get "books/:id/edit", to: "books#edit"
  #patch "books/:id", to: "books#update"
# como usuario puedo eliminarlo,
  #delete "books/:id", to: "books#destroy"
end
