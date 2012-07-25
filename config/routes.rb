Opengameday::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :events do
    collection do
      get 'game_search'
    end
  end

end
