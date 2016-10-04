Rails.application.routes.draw do
  root 'searches#search_my_representatives'

  resources :searches, only: [] do
    collection do
      get '/search_my_representatives', to: 'searches#search_my_representatives', as: 'search_reps'
      get '/search_elections', to: 'searches#search_elections', as:'search_elections'
      get '/search_representative', to: 'searches#search_representative', as: 'search_rep'
    end
  end
end
