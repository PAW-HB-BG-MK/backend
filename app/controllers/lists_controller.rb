class ListsController < ApplicationController
  before_action :authenticate_user
  def get_user(jwt)
    jwt = jwt[7..-1]
    decoded_token = JWT.decode jwt, Rails.application.credentials.secret_key_base, true, { :algorithm => 'HS256' }
    User.find_by(email:(decoded_token[0])['email'])
  end
  def add_list
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      board.lists.create(name: params[:name])
      user.save
      render json: {status: 'OK', message: 'ok', data:board}
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
end
