Rails.application.routes.draw do

  root to: "study_sets#index"


  post '/users/:id/study_sets/:id/copy', to: "study_sets#copy"
  get '/users/:id/study_sets/:id/sort', to: "study_sets#sort"
  post '/users/:id/study_sets/:id/sort', to: "study_sets#sort"
  post '/users/:id/study_sets/:id/study_mode', to: "study_sets#study_mode"
  get '/users/:id/study_sets/:id/study_mode', to: "study_sets#study_mode"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  resources :users, only: [:show] do
    resources :study_sets, only: [:show, :edit, :update, :destroy, :new, :create]
    resources :folders, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :study_sets, only: [:index]
  resources :flash_cards, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#  devise_scope :user do
#    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#  end
end
