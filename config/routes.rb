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
    get '/dashboard' => "nodal_employees#dashboard", as: "nodal_employee_dashboard"
  end
  
  scope :officers do
    get "/dashboard" => "officers#dashboard", as: "officer_dashboard"
    get "/add_employee" => "officers#new_employee", as: "add_employee"
    post "/add_employee" => "officers#create_employee"
  end

  scope :scheme_providers do 
    get "/dashboard" => "scheme_providers#dashboard", as: "scheme_provider_dashboard"
  end

  scope :admins do
    get "/dashboard" => "admins#dashboard", as: "admin_dashboard"
  end


  resources :ministries

  scope :ministries do 
    get "/:ministry_id/departments/index" => "departments#index", as: "departments"
    post "/:ministry_id/departments" => "departments#create"
    get "/:ministry_id/departments/new" => "departments#new", as: "new_department"
    get "/:ministry_id/departments/:department_id/edit" => "departments#edit", as: "edit_department"
    get "/:ministry_id/departments/:department_id" => "departments#show", as: "department"
    patch "/:ministry_id/departments/:department_id" => "departments#update"
    put "/:ministry_id/departments/:department_id" => "departments#update"
    delete "/:ministry_id/departments/:department_id" => "departments#destroy"
  end

  scope :departments do
    get "/:department_id/schemes/index" => "schemes#index", as: "schemes"
    post "/:department_id/schemes" => "schemes#create"
    get "/:department_id/schemes/new" => "schemes#new", as: "new_scheme"
    get "/:department_id/schemes/:scheme_id/edit" => "schemes#edit", as: "edit_scheme"
    get "/:department_id/schemes/:scheme_id" => "schemes#show", as: "scheme"
    patch "/:department_id/schemes/:scheme_id" => "schemes#update"
    put "/:department_id/schemes/:scheme_id" => "schemes#update"
    delete "/:department_id/schemes/:scheme_id" => "schemes#destroy"
  end

  namespace :api do
    namespace :v1 do
      match '/users/login' => 'users_api#login', via: [:post]
      match '/users/login' => 'users_api#cors_preflight_check', via: [:options]

      match '/users/logout' => 'users_api#logout', via: [:post]
      match '/users/logout' => 'users_api#cors_preflight_check', via: [:options]

      match 'users/edit' => 'users_api#edit_details', via: [:post]
      match 'users/edit' => 'users_api#cors_preflight_check', via: [:options]

      match 'users/add_company' => 'users_api#add_company', via: [:post]
      match 'users/add_company' => 'users_api#cors_preflight_check', via: [:options]

      match 'users/load_data' => 'users_api#load_data', via: [:get]
      match 'users/load_data' => 'users_api#cors_preflight_check', via: [:options]

      match 'users/ask_query' => 'users_api#ask_query', via: [:post]
      match 'users/ask_query' => 'users_api#cors_preflight_check', via: [:options]

      match 'users/apply_for_loan' => 'users_api#apply_for_loan', via: [:post]
      match 'users/apply_for_loan' => 'users_api#cors_preflight_check', via: [:options]
    end
  end

  get 'app' => 'home#loan_app'
  match '/app/*path' => 'home#loan_app', via: [:get]

  resources :tickets do
    resources :messages
  end

  get "/tickets" => 'tickets#index', as: 'tickets_index'
  # post "/tickets/:id/messages/new" => 'tickets#create', as: ''
  post "/ticket/:id/open_change_status" => 'tickets#open_change_status', as: 'open_change_status_ticket'
  post "/ticket/:id/resolved_change_status" => 'tickets#resolved_change_status', as: 'resolved_change_status_ticket'
  post "/ticket/:id/escalated_change_status" => 'tickets#escalated_change_status', as: 'escalated_change_status_ticket'
end
