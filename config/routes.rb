Codetalk::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"} do
      match '/auth/:provider/callback' => 'registrations#new'
  end
  root :to => 'home#index'
end
