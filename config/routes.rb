MyPartnerSite3::Application.routes.draw do
  get "message/index"
  get "choose_recipients/index"

  resources :groups

  resources :partners

  get "home/index"
  #  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  #  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  #  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/sign_out' => 'devise/sessions#destroy'
    #  get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    #  get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  devise_scope :user do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  post "create_message/", :to => "message#create_message"
#  post "create_message/", :to => "message#send_email"
  get "choose_recipients/:id", :to => "message#choose_recipients"
#  get "choose_recipients/:group_id", :to => "messages#choose_recipients"
  post "send_email/", :to => "message#send_email"
  get "sended_message/", :to => "message#sended_message"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
