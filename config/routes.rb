Rails.application.routes.draw do
    
  get 'admin/index' => 'admin#index'

    devise_for :users, :controllers => {
     :registrations => 'users/registrations',
     :sessions => 'users/sessions'
    }
    
    resources :posts
    
    root "home#top"  
    resources :home, :only => [:index]
    
    resources :users
    get "about" => "home#about"
    resources :inquiries
    get 'answers/:id/new' => 'answers#new'
    resources :answers
    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
