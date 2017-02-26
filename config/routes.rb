Rails.application.routes.draw do

  root to: "study_sets#index"
  
  post '/study_sets/:id/copy', to: "study_sets#copy"
  post '/study_sets/:id/sort', to: "study_sets#sort"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :study_sets, only: [:show, :edit, :update, :destroy, :new, :create]
    resources :folders, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :study_sets, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#  devise_scope :user do
#    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#  end
end
