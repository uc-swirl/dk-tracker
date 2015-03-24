  Swirlysurvey::Application.routes.draw do
  
  # devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # root :to => "experiments#index", :format => false
  # root :to => "volunteer_dashboard#index", :format => false, :as => :volunteer #perhaps just a placeholder
  root :to => "dashboard#index", :format => false, :as => :admin

  
  resources :survey_templates
  resources :submissions

  # devise_scope :user do
  #   get "/login" => "devise/sessions#new"
  #   get "/logout" => "devise/sessions#destroy"
  # end

  # match 'volunteer', :to => "volunteer_dashboard#index", :format => false, :as => :volunteer #perhaps just a placeholder

  # match 'volunteer/login', :to => "volunteer_dashboard#login", :format => false, :as => :volunteer_login #perhaps just a placeholder


  match 'admin', :to => 'dashboard#index', :format => false, :as => :dashboard
  match 'admin/add_user', :to => 'dashboard#add_user', :format => false, :as => :admin_add_user
  match 'admin/update_permissions', :to => 'dashboard#update_permissions', :format => false, :as => :admin_update_permissions

  match 'admin/login', :to => 'dashboard#login', :format => false, :as => :dashboard_login


# kind of placeholder-ing 
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'signout'


  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
