Rails.application.routes.draw do

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  resources :events, except: [:index] do

    resources :groups do
      resources :guests
    end

    resources :photos
    resources :venue_photos

    resources :guests
    resources :groups do
      put 'rsvp', on: :collection
      resources :guests
    end
  end

  namespace :admin do
    resources :events, except: [:index] do
      resources :sections
      resources :guests, except: [:show]
      resources :groups
    end
    root "admin#dashboard"
  end

  resources :photos, :only => [:index, :create, :destroy]

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  root "events#show"

 
end
