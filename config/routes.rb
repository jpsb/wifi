Rails.application.routes.draw do
  devise_for :usuarios
  resources :estabelecimentos do
    resources :avaliacoes
  end
  resources :avaliacoes, only: [:index] do
    get 'minhas', on: :collection
  end
  root 'estabelecimentos#index'
end
