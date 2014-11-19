GWWebsite::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # You can have the root of your site routed with "root"
  root 'static_pages#index'
  #root 'meals#index'
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
  # match "how_we_works" => "static_pages#how_we_works", via: :get
  get "how_we_works", to: "static_pages#how_we_works"
  get "users/:id", to: "users#show", as: "users"
  post 'notify', to: 'reservations#notify', as: 'notify'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :meals do
    resources :comments
    member do
      post :join
      post :quit
    end
  end

  resources :reservations, only: :show do 
    member do
      put :confirm
      put :reject
      put :recovery
    end
  end

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
