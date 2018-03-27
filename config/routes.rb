Rails.application.routes.draw do

  root "users#sign_in"
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

  scope :officers do
    get "/dashboard" => "officers#dashboard", as: "officer_dashboard"
  end

  scope :admins do
    get "/dashboard" => "admins#dashboard", as: "admin_dashboard"
  end

  post "/add_scheme" => "officers#add_scheme", as: "officer_add_scheme"
  resources :departments

  resources :conversations do
    resources :messages
  end

end
