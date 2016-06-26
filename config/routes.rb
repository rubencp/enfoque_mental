Rails.application.routes.draw do
  post 'receive_message', to: 'receive_message#receive'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
