Rails.application.routes.draw do

   root 'welcome#index'
   get '/home',to:'home#index'
   devise_for :user
   resource :user
   namespace :admin do
     resources :products do
       member do
         post :publish
         post :hide
         post :move_up
         post :move_down
       end
     end
     resources :categories
      resources :orders do
        member do
          post :cancel
          post :ship
          post :shipped
          post :return
       end
     end
   end
     resources :favorite

     resources :products do
       member do
         post :add_quantity
         post :remove_quantity
       end
       member do
         post :add_to_cart
       end
       resources :reviews
       put :favorite, on: :member
       collection do
         get :search
       end
    end

    # resources :reviews

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :carts do
     collection do
      delete :clean
       post :checkout
     end
   end

   resources :cart_items do
     member do
       post :add_quantity
       post :remove_quantity
     end
   end

   resources :orders do
      member do
        post :pay_with_alipay
        post :pay_with_wechat
        post :apply_to_cancel
      end
   end

    namespace :account do
       resources :orders
       resources :users
    end

    resources :categories do
      resources :products
    end
end
