Rails.application.routes.draw do

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  resources :events, except: [:index] do

    resources :guests do
      collection do
        post 'search'
      end
      member do
        post 'rsvp'
      end
    end

  end

  namespace :admin do
    resources :events, except: [:index] do
      resources :guests, except: [:show]
    end
    root "admin#dashboard"
  end

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]
  root "events#show"

end
