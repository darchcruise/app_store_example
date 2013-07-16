AppStore::Application.routes.draw do
  root to: 'apps#index'

 resources :users, only: [:index, :show, :new, :create] do

  resources :apps , only: [:index]
end



  resources :users, only: [:index, :show, :new, :create]
  # resources :users, except: [:destroy, :edit, :update]
  resources :apps, only: [:index, :show]

 put '/apps/:id/buy', to: 'apps#buy', as: 'buy_app'

# Redirect Alias
 get '/applications', to: redirect('/apps')
end
