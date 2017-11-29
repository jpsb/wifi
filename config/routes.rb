Rails.application.routes.draw do
  resources :estabelecimentos do
    resources :avaliacoes
  end
  root 'estabelecimentos#index'
end
