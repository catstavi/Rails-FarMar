Rails.application.routes.draw do

  # to-do: use validates for ids, use route names

  post "/vendors",            to: "vendors#create"
  get  "/signup",             to: "vendors#new"
  get "/vendors",             to: "vendors#display"
  post "/login",              to: "vendors#login"
  post "/logout",             to: "vendors#logout"

  get "/markets",             to: "markets#display" # market/display.html.erb
  get "/make_market",         to:  "markets#new"
  post "/markets",            to: "markets#create"
  get "/markets/:id",         to: "markets#by_id"
  get "/markets/:id/edit",    to: "markets#edit"
  put "/markets/:id",         to: "markets#update"
  post "/markets/:id",       to: "vendors#set_market"

  get "/products",            to: "products#display"
  get "/products/new",        to: "products#new"
  post "/products",           to: "products#create"
  get "/products/:id",        to: "products#by_id"
  get "/products/:id/edit",   to: "products#edit"
  put "/products/:id",        to: "products#update"
  delete "/products/:id",     to: "products#delete"


  get "/vendors/:id/edit", to: "vendors#edit", as: :edit_vendor
  put "/vendors/:id",    to: "vendors#update"

  root "vendors#home"

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
