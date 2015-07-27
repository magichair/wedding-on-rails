Rails.application.routes.draw do

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  resources :events, except: [:index] do

    member do
      post 'search'
    end

    resources :guests do
      member do
        post 'rsvp'
        get 'rsvp'
      end
    end

  end

  namespace :admin do
    resources :events, except: [:index] do
      resources :guests, except: [:show]
    end
    root "admin#dashboard"
  end

  root "events#show"

end
