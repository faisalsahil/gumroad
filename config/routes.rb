Store::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  # resources :integrations
  # resources :actions

  get "view/show"

  devise_for :users ,:controllers => {
    :registrations => "registrations",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  # resources :myforms do
  #   collection do
  #     get 'myform'
  #     get 'mandrill_templates'
  #     post 'load_groups'
  #   end

  #   member do
  #     post 'field'
  #     post 'group'
  #     post 'segment'
  #   end
  # end
# resources :homes,:only => [:show]

  # resources :forms do
  #   collection do
  #     get 'submit'
  #     get 'submission'
  #     get 'webhook'
  #   end
  #  member do
  #     post 'submit'
  #     post 'submission'
  #     post  'webhook'
  #   end
  # end

  # resources :billing do
  #   collection do
  #     get 'index'
  #   end

  #   member do
  #     post 'index'
  #   end
  # end


# my////////////////////////////////
resources :plans do
  collection do
    get :aaaa  
  end
end

resources :cardinfos do
 
 member do
  get :update_billing
 end
end

resources :mappings do
  collection do
    get :load_merge_vars
  end
end
resources :pings do
  collection do
  get :gum_request
 end
end

resources :billings,:only => [:index]
# ////////////////////////////////////////////
  resources :subscriptions do
    collection do
      get 'new'
    end
  end

  resources :users do
    collection do
      get 'new'
    end
  end


  match "/dashboard" => "dashboard#index", :as => :dashboard

   match ':controller(/:action(/:id))(.:format)'
   match ':controller(/:action(/:userid/:formid))'
  #match 'tracking_image/:id', :to => 'tracking#image', :as => "tracking_image"
   root :to => "home#show"
   # root :to=>"dashboard#index"

end
