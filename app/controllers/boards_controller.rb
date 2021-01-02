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
    boards = user.boards
    render json: {status: 'OK', message: 'Returning boards', data:boards}
  end

  def get_board
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      render :json => board.to_json(include: {lists: {include: :cards}})
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end

  def add_board
    header_value = request.authorization
    user = get_user(header_value)
    user.boards.create(name: params[:name])
    user.save
    render json: {status: 'CREATED', message: 'Returning current boards', data:user.boards}
  end

  def edit_board
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      board.update_attribute(:name, params[:name])
      render json: {status: 'UPDATED', message: 'Board updated'}
    else
      render json: {status: 'UNAUTHORIZED', message: 'This board does not belong to you'}
    end
  end

  def add_user_to_board
    user_to_add = User.find_by(email:params[:email])
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:board_id])
    if board != nil
      user_to_add.boards << board
      user_to_add.save
      render json: {status: 'OK', message: 'User assigned'}
    else
      render json: {status: 'UNAUTHORIZED', message: 'This board does not belong to you'}
    end
  end
end
