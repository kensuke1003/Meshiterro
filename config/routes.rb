Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy] #idの受け渡しがないため、単数形でok
    
    resources :post_comments, only: [:create, :destroy] #idを受け渡し、show.htmlが関係しているから複数形である必要があ
  end
 resources :users, only: [:show, :edit, :update]
end
