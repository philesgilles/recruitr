Rails.application.routes.draw do
  root to: 'pages#home'

  resources :positions
  resources :candidates
  resources :recruiters


  post '/candidates/:id/add-recruiter/:recruiter', to: 'candidates#add_recruiter'
  delete '/candidates/:id/add-recruiter', to: 'candidates#remove_recruiter'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
