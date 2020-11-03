module Api
  module V1
    class PingController < ApplicationController
      def index
        pongs = Pong.order('created_at DESC');
        render json: {status: 'OK', message: 'got ping', data:pongs}
      end
    end
  end
end
