Rails.application.routes.draw do
  scope '/auth' do
    post '/sign_in', to: 'user_token#create'
    post '/sign_up', to: 'users#create'
  end
  scope '/api' do
    get '/boards', to: 'boards#get_boards'
    post '/board/add', to: 'boards#add_board'
    post '/board/edit', to: 'boards#edit_board'
    get '/board', to: 'boards#get_board'
    post '/list/add', to: 'lists#add_list'
    post '/card/add', to: 'cards#add_card'
    post '/card/remove', to: 'cards#remove_card'
    post '/card/edit', to: 'cards#edit_card'
    post '/card/edit/deadline', to: 'cards#set_card_deadline'
    post '/list/remove', to: 'lists#remove_list'
    post '/list/edit/name', to: 'lists#edit_list_name'
  end
  namespace 'api' do
    namespace 'v1' do
      resources :ping
    end
  end
end

