Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
    get "signup", :to => "users/registrations#new"
    get "users/:id", :to => "users/registrations#detail"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    post 'users/guest_sign_in', to: "users/sessions#new_guest"
  end

  post '/tops/guest_sign_in', to: "tops#new_guest"
end
