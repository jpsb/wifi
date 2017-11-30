Rails.application.routes.draw do
  devise_for :usuarios
  resources :estabelecimentos do
    resources :avaliacoes
  end
  root 'estabelecimentos#index'
end
