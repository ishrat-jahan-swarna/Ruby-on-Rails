Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login'  => :create
    delete 'logout' => :destroy
  end
  get 'sessions/create'
  get 'sessions/destroy'

  # START_HIGLIGHT
  resources :support_requests, only: [ :index, :update ]
  # END_HIGLIGHT
  resources :users
  resources :products do
    get :who_bought, on: :member
  end
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #######
  #FOR SENDING EMAILS
  #http://localhost:3000/rails/conductor/action_mailbox/inbound_emails
end
