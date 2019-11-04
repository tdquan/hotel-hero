Rails.application.routes.draw do
  devise_for :users
  devise_for :hoteliers, path: "h"
  devise_for :vendors, path: "v"

  authenticated :user, lambda { |u| u.type == "User" } do
		root to: 'home#dashboard', as: 'authenticated_user'
  end

  authenticated :hotelier, lambda { |h| h.type == "Hotelier" } do
		root to: 'home#hotelier_dashboard', as: 'authenticated_hotelier'
  end

  authenticated :vendor, lambda { |v| v.type == "Vendor" } do
		root to: 'home#vendor_dashboard', as: 'authenticated_vendor'
  end

  root to: 'home#index'
end
