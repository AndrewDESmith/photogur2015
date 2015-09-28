Rails.application.routes.draw do
  get 'pictures' => 'pictures#index'

  post 'pictures' => 'pictures#create'
  get 'pictures/new' => 'pictures#new'

  get 'pictures/:id' => 'pictures#show', as: "picture"
  # as: "picture" allows us to refer to this route as picture_path (the string is prepended to _path).
end
