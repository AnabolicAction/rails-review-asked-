Rails.application.routes.draw do


  get 'users/index'
  get '/signup' => 'users#new'
  post 'users' => 'users#create'
  get '/login' => 'users#login'
  post '/loginprocess' => 'users#loginprocess'
  get '/logout' => 'users#logout'
  get '/users/:id/posts' => 'users#posts' #사용자(users)의 1번애(:id)가 쓰는글(posts)

root 'posts#index'
  # get 'posts' =>'posts#index'
  #
  # get 'posts/new'
  #
  # post 'posts' => 'posts#create' #실제로 데이터를 받아서 저장
  #
  # get 'posts/:id' => 'posts#show'
  #
  # get 'posts/:id/edit' =>'posts#edit'
  #
  # put 'posts/:id' => 'posts#update' #put 서버로 보내진 데이터를 수정해야할때
  #
  # delete 'posts/:id' => 'posts#destroy'

  resources :posts



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
