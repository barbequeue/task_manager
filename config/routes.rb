Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :projects do
    resources :tasks do
      member do
        patch 'checkout'
      end
    end
  end
end
