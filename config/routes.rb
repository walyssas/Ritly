Ritly::Application.routes.draw do
  devise_for :users
    root "rits#index"
    resources :rits, only: [:new, :create, :show]

    get '/:rits' => 'rits#redirector'
    get '/:rits/preview' => 'rits#preview'

  end
