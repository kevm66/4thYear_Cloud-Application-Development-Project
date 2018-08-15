Rails.application.routes.draw do
  devise_for :users
root to: "doctors#index"
  get 'patients/index'
  get 'patients/show'
  get 'patients/new'
  get 'patients/edit'
  resources :doctors do
    resources :patients
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
