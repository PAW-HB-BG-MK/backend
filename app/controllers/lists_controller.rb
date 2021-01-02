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
      number = 0
      if !board.lists.any?
        number = 1
      else
        board.lists.each do |list|
          if list.order > number
            number = list.order
          end
        end
        number = number + 1
      end
      board.lists.create(name: params[:name], archived: false, order:number)
      user.save
      render json: {status: 'OK', message: 'List created'}
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
  def remove_list
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      target_list = board.lists.where(id:params[:list_id]).first
      number = target_list.order
      board.lists.each do |list|
        if list.order > number
          list.update_attribute(:order, list.order - 1)
        end
      end
      target_list.destroy
      user.save
      render json: {status: 'OK', message: 'List deleted'}
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
  def edit_list_name
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      list = board.lists.where(id:params[:list_id]).first
      if list != nil
        list.update_attribute(:name, params[:name])
        list.save
        user.save
        render json: {status: 'OK', message: 'List name updated'}
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end

    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
  def change_list_archive_status
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      list = board.lists.where(id:params[:list_id]).first
      if list != nil
        status = !list.archived
        list.update_attribute(:archived, status)
        list.cards.each do |card|
          card.update_attribute(:archived, status)
        end
        list.save
        user.save
        render json: {status: 'OK', message: 'List status updated'}
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end

    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
  def change_list_order
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      target_list = board.lists.where(id:params[:list_id]).first
      if target_list != nil
        if target_list.order == params[:position]
          render json: {status: 'OK', message: 'List position unchanged'}
        elsif target_list.order > params[:position]
          board.lists.each do |list|
            if list.order < target_list.order && list.order >= params[:position]
              list.update_attribute(:order, list.order + 1)
            end
          end
          target_list.update_attribute(:order, params[:position])
        elsif target_list.order < params[:position]
          board.lists.each do |list|
            if list.order > target_list.order && list.order <= params[:position]
              list.update_attribute(:order, list.order - 1)
            end
          end
          target_list.update_attribute(:order, params[:position])
        end
        target_list.save
        board.save
        user.save
        render json: {status: 'OK', message: 'List position updated'}
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end

    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
end
