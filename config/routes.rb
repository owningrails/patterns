Routes = Router.new do
  match '/' => 'home#index'
  match '/hi' => 'home#index'
  match '/users' => 'users#index'
end