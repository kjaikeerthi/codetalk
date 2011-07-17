Codetalk::Application.routes.draw do
  devise_for :users
  root :to => 'home#index'
  match '/auth/:provider/callback' => 'home#callback'
end
