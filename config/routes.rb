Rails.application.routes.draw do
  match '*path' => 'options_request#response_preflight_request', via: :options
  namespace 'api' do
    namespace 'v1' do
      resources :regexes
      resources :users
      resources :posts
    end
  end
end