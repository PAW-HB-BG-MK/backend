class BoardsController < ApplicationController
  before_action :authenticate_user
  def get_user(jwt)
    jwt = jwt[7..-1]
    decoded_token = JWT.decode jwt, Rails.application.credentials.secret_key_base, true, { :algorithm => 'HS256' }
    User.find_by(email:(decoded_token[0])['email'])
  end

  def get_boards
    header_value = request.authorization
    user = get_user(header_value)
    boards = Board.where(user_id:user.id)
    render json: {status: 'OK', message: 'Returning boards', data:boards}
  end

  def add_board
    header_value = request.authorization
    user = get_user(header_value)
    user.boards.create(name: params[:name])
    user.save
    render json: {status: 'CREATED', message: 'Returning current boards', data:user.boards}
  end

end
