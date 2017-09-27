Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :folders, :except => :destroy

  
  
  devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout'} do
    get "/users/logout", :to => "devise/sessions#destroy"
  end
  
  resources :users
  resources :agreements do 
    resources :transfers, :except => [:edit, :destroy]
  end
end
