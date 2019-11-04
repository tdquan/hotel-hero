Rails.application.routes.draw do
  devise_for :users
  devise_for :hoteliers, path: "h"
  devise_for :vendors, path: "v"

  authenticated :user, lambda { |u| u.user? } do
		root to: 'home#dashboard', as: 'user_dashboard'
  end

  authenticated :hotelier, lambda { |h| h.hotelier? } do
		root to: 'home#hotelier_dashboard', as: 'hotelier_dashboard'
    namespace :h do
      resources :software_suites, only: [:create, :update, :delete]
      resources :softwares, only: [:index, :show]
    end
  end

  authenticated :vendor, lambda { |v| v.vendor? } do
		root to: 'home#vendor_dashboard', as: 'vendor_dashboard'
    namespace :v do
      resources :softwares, only: [:new, :create, :delete]
    end
  end

  root to: 'home#index'
end
