class Api::RobotsController < ApplicationController

  require './lib/robot.rb'

  def orders
    input = params[:commands]
    result = Robot.execute(input)
    render json: { location: result }, status: :ok
  end
end
