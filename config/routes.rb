Rails.application.routes.draw do
  resources :limits_elongations
  resources :constructions_activities
  resources :activities_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # defaults to dashboard
  root to: 'dashboard#index'
  get 'dashboard', to: 'dashboard#index'

  resources :comments
  resources :cables_reviews_types
  resources :jacks_uses
  resources :positions_cables
  resources :spreadsheets_equipments
  resources :spreadsheets
  
  resources :users, :path => "users_company"
  
  resources :constructions do
    get '/new_spreadsheet', to: 'spreadsheets#new_spreadsheet'
    post 'create_cables', to: 'spreadsheets#create_cables'
    resources :projects
    resources :spreadsheets do
      get 'elongations', to: 'elongations#show_elongations'
      get 'report_elongations', to: 'elongations#report_elongations'
      resources :spreadsheets_equipments
      resources :elongations
      resources :cables do
        resources :elongations
      end
    end
  end
  
  get '/construction_details/:id', to: 'constructions#constructions_dashboard'

  resources :phones
  resources :phones_types
  resources :addresses
  resources :roles_assignments
  resources :roles
  resources :companies do
    resources :pumps
    resources :jacks
  end

  post 'reset_password_user', to: 'password#reset_password_user'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # api routes
  get '/api/datatable' => 'api#datatable'
  get '/api/i18n/:locale' => 'api#i18n'
  post '/api/xeditable' => 'api#xeditable'
  get '/api/xeditable-groups' => 'api#xeditablegroups'

  # the rest goes to root
  #get '*path' => redirect('/')
end
