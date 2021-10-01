class Api::RobotsController < ApplicationController
    require './lib/robo.rb'
    def orders
        input=params[:commands]
        @result=Robot.execute(input)
        render json: @result , status: :ok
    end
end
