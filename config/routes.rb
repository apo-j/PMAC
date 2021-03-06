PMAC::Application.routes.draw do

  get "address/new"
  get "address/create"
  get "address/destroy"
  match "address", to:'address#create', via: 'post'


  get "preorder/livraison"
  get "preorder/facturation"
  match "preorder/recapitulatif", to:'preorder#recapitulatif', via: 'post'
  match "preorder/payment", to:'preorder#payment', via: 'post'
  match "preorder/process-payment", to:'preorder#process_payment', via: 'post'
  get "preorder/confirmation"
  get "message/new"
  match "messages", to:'message#create', via: 'post'
  match "configurator/pvc" , to: "configurator#index", via: 'get'
  match "configurator/aluminium" , to: "configurator#indexAlu", via: 'get'
  match "configurator/store" , to: "configurator#indexStore", via: 'get'
  match "configurator/rideaux-metalique" , to: "configurator#indexRideaux", via: 'get'
  match "configurator/volet-roulant" , to: "configurator#indexVoletRoulant", via: 'get'
  match "configurator/accessoires" , to: "configurator#indexAccessoires", via: 'get'
  match "price", to:'configurator#price_data', via: 'post'

  resources :users

  resources :orders
  match "orders/next",to:'orders#next_step', via: 'post'
  match "orders/back",to:'orders#go_back', via: 'post'
  match "orders/cancel",to:'orders#cancel', via: 'post'
  match "orders/search",to:'orders#search', via: 'post'

  resources :line_items

  resources :carts

  match "show-cart", to: 'carts#show', via: "get"


  get "store/index"
  resources :products do
    get :who_bought, on: :member
  end

  root 'store#index', as: 'root'

  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match "/users/search",to:'users#search', via: 'post'
  match '/forget-password', to: 'users#forget_pwd',     via: 'get'
  match "/process-forget-password",to:'users#process_forget_pwd', via: 'post'
  match '/reset-password/:token', to: 'users#reset_pwd',     via: 'get'
  match '/process-reset-password', to: 'users#process_reset_pwd',     via: 'post'

  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'get'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
