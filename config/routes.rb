Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  scope '/auth' do
    post '/sign_in', to: 'user_token#create'
  end
  namespace 'api' do
    namespace 'v1' do
      resources :ping
    end
  end
end

