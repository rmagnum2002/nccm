Nccm::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :team_members

  get "messages/create"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "news" => "posts#index", as: :news
  # get "utilities" => "utilities#index", as: :utilities
  get "news/:id" => "posts#show", as: :post
  get "welcome/index"
  get "calculator" => "welcome#calculator", as: :calculator
  get "team" => "welcome#team", as: :team
  get "contacts" => "welcome#contacts", as: :contacts
  get "plastic_calc" => "welcome#plastic_calc", as: :plastic_calc
  get "metalic_calc" => "welcome#metalic_calc", as: :metalic_calc
  get "technology" => "welcome#technology", as: :technology
  get "optic_fibers" => "welcome#optic_fibers", as: :optic_fibers
  get "equipment" => "utilities#index", as: :equipment
  get "docs" => "welcome#docs", as: :docs
  get "partners" => "clients#index", as: :partners
  get "completed_tasks" => "welcome#completed_tasks", as: :completed_tasks
  get 'set_locale' => 'welcome#set_locale'
  get 'gallery' => 'welcome#gallery'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :posts
  resources :utilities
  resources :clients
  resources :messages
  resources :documents


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
