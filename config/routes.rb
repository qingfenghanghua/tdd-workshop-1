Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json} do
    scope module: :v1 do
       resource :users, only: [:show,:create]
       end
    end
   root to: 'home#index'
end
