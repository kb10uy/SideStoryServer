Rails.application.routes.draw do
  get 'search' => 'search#all', :as => :search_all
  get 'search/posts'
  get 'search/users'
  get 'search/requests'

  get 'about' => 'static#about'
  get 'tutorial' => 'static#tutorial'
  get 'policy' => 'static#policy'
  get 'contact' => 'static#contact'
  get 'mypage' => 'mypage#index'
  
  get 'posts/new'
  post 'posts/new' => 'posts#register'
  get 'posts/:id' => 'posts#show', :as => :posts_show
  get 'posts/:id/edit' => 'posts#edit', :as => :posts_edit
  patch 'posts/:id/update' => 'posts#update', :as => :posts_update
  get 'posts/:id/delete' => 'posts#delete', :as => :posts_delete
  delete 'posts/:id/delete' => 'posts#destroy', :as => :posts_destroy
  patch 'posts/:id/nice' => 'posts#nice', :as => :posts_nice
  patch 'posts/:id/bad' => 'posts#bad', :as => :posts_bad
  
  devise_for :users
  
  get 'home/welcome'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#welcome'

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
