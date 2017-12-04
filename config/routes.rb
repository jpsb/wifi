Rails.application.routes.draw do
  devise_for :usuarios, controllers: { omniauth_callbacks: :omniauth_callbacks }

  resources :estabelecimentos do
    resources :avaliacoes
  end
  resources :avaliacoes, only: [:index] do
    get 'minhas', on: :collection
  end
  root 'estabelecimentos#index'
end
