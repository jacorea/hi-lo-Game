Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/greet/:number' => 'greeting#greet'

  get '/game' => 'game#try'
  match '/try', to: "game#try", via: [:get, :post], as: 'try'
  match '/reset', to: "game#reset", via: [:get], as: 'reset'
end
