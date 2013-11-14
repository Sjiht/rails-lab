Uvacourses::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to: 'course#index'

  # Example of regular route:
  # get 'information/course' => 'information#course'
  # get '/information/course/:id', to: 'information#course', as: 'course'
  get '/course/', to: 'course#index'
  get '/course/list/', to: 'course#index'
  get '/course/list/:instituut', to: 'course#list'
  get '/course/information/', to: 'course#index'
  get '/course/information/:vakID', to: 'course#information'
  
  get '/saved/list/', to: 'saved#list'
  get '/saved/add/:vakID', to: 'saved#add'
  get '/saved/delete/:vakID', to: 'saved#delete'
  
  get '/favorite/list/', to: 'favorite#list'
  get '/favorite/add/:vakID', to: 'favorite#add'
  get '/favorite/delete/:vakID', to: 'favorite#delete'
  
  get '/recent/list/', to: 'recent#list'
  get '/recent/add/:vakID', to: 'recent#add'
  get '/recent/delete/:vakID', to: 'recent#delete'

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
