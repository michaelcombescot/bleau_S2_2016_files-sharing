Rails.application.routes.draw do

  root to: 'main#index'

  # permet l'ajout des routes nécessaires au bon fonctionnement de devise sur l'entité User.
  # on spécifie aussi qu'on souhaite surcharger le controller par défaut avec notre controller
  # dans /app/controllers/users/registrations_controller
  devise_for :users, :controllers => { registrations: 'users/registrations', passwords: "users/passwords" }

  # other routes
  get 'index' => 'main#index', as: :index
  get 'login/download' => 'media#download', as: :download
  get 'search_files' => 'main#search_files', as: :search_files_modal
  get 'home' => 'main#home', as: :home_modal
  get 'search_users' => 'media#search_users'
  get 'search_home_pagination' => "main#search_home_pagination"

  scope :groups do
    get 'search_groups' => 'groups#search_groups', as: :search_groups
    post 'send_group_request' => 'groups#send_request', as: :send_group_request
    get 'my_groups' => 'groups#my_groups_modal', as: :my_groups_modal
  end
  
# CRUD
  resources :groups
  resources :media

end
