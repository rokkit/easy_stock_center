EasyStockCenter::Application.routes.draw do



  resources :tools, only: [:index, :new, :create]

  resources :traderooms, shallow: true do
    resources :tools
  end

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  
  ComfortableMexicanSofa::Routing.admin :path => '/admin'

  # Make sure this routeset is defined last
  ComfortableMexicanSofa::Routing.content :path => '/', :sitemap => false
end