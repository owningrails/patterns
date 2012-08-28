Routes = Router.new do
  match '/' => 'home#index'
  match '/yo' => 'home#index'
  match '/users' => 'users#index'
  match '/echo' => 'echo#index'
end