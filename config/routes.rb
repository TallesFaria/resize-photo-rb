Rails.application.routes.draw do
  root to: proc { [404, {}, ["<h1>Not Found</h1>"]] }

  resources :images, only: :index do
    post :update_all, on: :collection
  end
end
