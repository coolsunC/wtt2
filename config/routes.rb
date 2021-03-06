Rails.application.routes.draw do

post 'users/login/' => 'users#login' , as: :login
  resources :games do
    resources :milestones 
  end
 
  resources :users do
    resources :eods do
       resources :qaeods
       resources :loceods
    end
  end

 

  post 'users/:id/eods/new/' => 'eods#new' , as: :new
  post 'users/:user_id/eods/:eod_id/qaeods/new' => 'qaeods#new' , as: :newqaeod
  post '/users/:id' => 'users#show' , as: :showuser
  get 'users/:id/list' => 'users#list' , as: :userlist
  post 'users/:id/resourceallocation' => 'users#resourceallocation' , as: :resourceallocation
  post 'users/:id/report' => 'users#report' , as: :report
  post 'users/:id/projectdata' => 'users#projectdata' , as: :projectdata
  post 'users/:id/projectdatams' => 'users#projectdatams' , as: :projectdatams
#  get 'users/:id/updateeod' => 'users#updateeod' , as: :updateeod
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
