class CardsController < ApplicationController
  before_action :authenticate_user
  def get_user(jwt)
    # jwt = jwt[7..-1]
    # decoded_token = JWT.decode jwt, Rails.application.credentials.secret_key_base, true, { :algorithm => 'HS256' }
    User.find_by(email:current_user['email'])
  end
  def add_card
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      list = board.lists.find_by(id:params[:list_id])
      if list != nil
        list.cards.create(name: params[:name], description: params[:description], archived: false)
        card = list.cards.find_by(name:params[:name])
        card.events.create(name: "created", timestamp: Time.now.getutc.to_i)
        card.save
        user.save
        render json: {status: 'CREATED', message: 'Card created'}
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
  def remove_card
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      list = board.lists.find_by(id:params[:list_id])
      if list != nil
        list.cards.where(id:params[:card_id]).first.destroy
        user.save
        render json: {status: 'OK', message: 'Card deleted'}
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
  def edit_card
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      list = board.lists.find_by(id:params[:list_id])
      if list != nil
        card = list.cards.where(id:params[:card_id]).first
        if card != nil
          if params[:name].present?
            card.update_attribute(:name, params[:name])
            card.events.create(name: "name changed to " + params[:name], timestamp: Time.now.getutc.to_i)
          end
          if params[:description].present?
            card.update_attribute(:description, params[:description])
            card.events.create(name: "description changed to " + params[:description], timestamp: Time.now.getutc.to_i)
          end
          user.save
          render json: {status: 'OK', message: 'Card updated'}
        else
          render json: {status: 'ERROR', message: 'You do not have rights or card does not exist'}
        end
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
  def set_card_deadline
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      list = board.lists.find_by(id:params[:list_id])
      if list != nil
        card = list.cards.where(id:params[:card_id]).first
        if card != nil
          card.update_attribute(:deadline, params[:deadline])
          card.events.create(name: "deadline changed", timestamp: Time.now.getutc.to_i)
          user.save
          render json: {status: 'OK', message: 'Card deadline updated'}
        else
          render json: {status: 'ERROR', message: 'You do not have rights or card does not exist'}
        end
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
  def change_card_archive_status
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      list = board.lists.find_by(id:params[:list_id])
      if list != nil
        card = list.cards.where(id:params[:card_id]).first
        if card != nil
          card.update_attribute(:archived, !card.archived)
          if card.archived
            card.events.create(name: "unarchived", timestamp: Time.now.getutc.to_i)
          else
            card.events.create(name: "archived", timestamp: Time.now.getutc.to_i)
          end
          user.save
          render json: {status: 'OK', message: 'Card status updated'}
        else
          render json: {status: 'ERROR', message: 'You do not have rights or card does not exist'}
        end
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
  def get_card_events
    header_value = request.authorization
    user = get_user(header_value)
    board = user.boards.find_by(id:params[:id])
    if board != nil
      list = board.lists.find_by(id:params[:list_id])
      if list != nil
        card = list.cards.where(id:params[:card_id]).first
        if card != nil
          events = card.events
          render json: {status: 'OK', message: 'Returning events', data:events}
        else
          render json: {status: 'ERROR', message: 'You do not have rights or card does not exist'}
        end
      else
        render json: {status: 'ERROR', message: 'You do not have rights or list does not exist'}
      end
    else
      render json: {status: 'ERROR', message: 'You do not have rights or board does not exist'}
    end
  end
end
