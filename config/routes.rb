Rails.application.routes.draw do
  resources :estabelecimentos
  root 'estabelecimentos#index'
end
