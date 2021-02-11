Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'books#top'
  get 'books' => 'books#index'
  post 'books' => 'books#create'
  get 'new' => 'books#new'
  get 'books/:id' => 'books#show', as: 'bookshow'
end
