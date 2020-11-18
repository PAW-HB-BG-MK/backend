Rails.application.routes.draw do
  scope '/auth' do
    post '/sign_in', to: 'user_token#create'
  end
  scope '/api' do
    get '/boards', to: 'boards#get_boards'
    post '/board/add', to: 'boards#add_board'
  end
  namespace 'api' do
    namespace 'v1' do
      resources :ping
    end
  end
end

