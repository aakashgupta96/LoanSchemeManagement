Rails.application.routes.draw do

  root 'users#sign_in'
  scope :users do 
    get "/sign_up" => "users#sign_up", as: "sign_up_user"
    get "sign_in" => "users#sign_in", as: "sign_in_user"
    get "/edit" => "users#edit", as: "edit_user"
    patch "/update" => "users#update", as: "update_user"
    get "/dashboard" => "applicants#dashboard", as: "user_dashboard"
    
    post "/create" => "users#create", as: "create_user_session"
    post "/sign_in" => "users#create_session"
    post "/sign_out" => "users#sign_out", as: "destroy_user_session"
  end

  #root 'home#loan_app'

  scope :nodal_employees do 
    get '/dashboard' => "nodal_employees#dashboard", as: "nodal_employees_dashboard"
  end
  
  scope :officers do
    get "/dashboard" => "officers#dashboard", as: "officer_dashboard"
    get "/add_employee" => "officers#new_employee", as: "add_employee"
    post "/add_employee" => "officers#create_employee"
  end

  scope :admins do
    get "/dashboard" => "admins#dashboard", as: "admin_dashboard"
  end

  resources :departments

  namespace :api do
    namespace :v1 do
      match '/users/login' => 'users_api#login', via: [:post]
      match '/users/login' => 'users_api#cors_preflight_check', via: [:options]

      match '/users/logout' => 'users_api#logout', via: [:post]
      match '/users/logout' => 'users_api#cors_preflight_check', via: [:options]
    end
  end

  get 'app' => 'home#loan_app'
  match '/app/*path' => 'home#loan_app', via: [:get]
end
