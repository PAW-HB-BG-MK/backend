class CardsController < ApplicationController
  before_action :authenticate_user
  def get_user(jwt)
    jwt = jwt[7..-1]
    decoded_token = JWT.decode jwt, Rails.application.credentials.secret_key_base, true, { :algorithm => 'HS256' }
    User.find_by(email:(decoded_token[0])['email'])
  end
  def add_card
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      list = board.lists.find_by(id:params[:list_id])
      if list != nil
        list.cards.create(name: params[:name], description: params[:description])
        user.save
        render json: {status: 'CREATED', message: 'Card created'}
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
end
