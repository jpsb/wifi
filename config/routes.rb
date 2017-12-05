Rails.application.routes.draw do
  devise_for :usuarios, controllers: { omniauth_callbacks: :omniauth_callbacks }
  resources :estabelecimentos
  resources :avaliacoes do
    get 'minhas', on: :collection
  end
  get "/sobre" => "pages#sobre"
  root 'pages#sobre'
end
