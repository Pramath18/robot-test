class Robot
  class << self
#   # directions
#   NORTH = 'NORTH'
#   SOUTH = 'SOUTH'
#   EAST = 'EAST'
#   WEST = 'WEST'

#   # commands
#   PLACE = 'PLACE'
#   MOVE = 'MOVE'
#   LEFT = 'LEFT'
#   RIGHT = 'RIGHT'

#   def self.execute(input)
#     result = []
#     x = 0
#     y = 0..5
#     current_direction = NORTH
#     # x = input.split(' ')
#     # if x[0] == PLACE
#       input.each do |c|
#         if c[0..4] == PLACE
#           cords = c.split(' ')[1].split(',')
#           x = cords[0].to_i
#           if x == (0..5)
#             y = cords[1].to_i
#             if y == (0..5)

#           current_direction = cords[2]
#         elsif c == MOVE
#           current_direction, x, y = move_robot(current_direction, x, y)
#         elsif c == LEFT
#           current_direction = move_robot_left(current_direction)
#         elsif c == RIGHT
#           current_direction = move_robot_right(current_direction)
#         elsif c == 'REPORT'
#           result.push(x, y, current_direction)
#         end
#       end
#     # else
#     #   result = 'no place found'
#     # end
#     result
#   end

#   # private

#   def self.move_robot_left(current_direction)
#     current_direction = if current_direction == NORTH
#                           WEST
#                         elsif current_direction == SOUTH
#                           EAST
#                         elsif current_direction == EAST
#                           NORTH
#                         elsif current_direction == WEST
#                           SOUTH
#                         end
#     current_direction
#   end

#   def self.move_robot_right(current_direction)
#     current_direction = if current_direction == NORTH
#                           EAST
#                         elsif current_direction == SOUTH
#                           WEST
#                         elsif current_direction == EAST
#                           SOUTH
#                         elsif current_direction == WEST
#                           NORTH
#                         end
#     current_direction
#   end

#   def self.move_robot(current_direction, x, y)
#     if current_direction == NORTH
#       y += 1 if y >= 0 && y < 5
#     elsif current_direction == SOUTH
#       y -= 1 if y >= 0 && y < 5
#     elsif current_direction == EAST
#       x += 1 if x >= 0 && x < 5
#     elsif current_direction == WEST
#       x -= 1 if x >= 0 && x < 5
#     end
#     [current_direction, x, y]
#   end
# end
# require 'test.rb'

    NORTH = 'NORTH'
    SOUTH = 'SOUTH'
    EAST = 'EAST'
    WEST = 'WEST'

    # commands
    PLACE = 'PLACE'
    MOVE = 'MOVE'
    LEFT = 'LEFT'
    RIGHT = 'RIGHT'

    DIRECTION_MAPPER = { "NORTH_LEFT": 'WEST', "NORTH_RIGHT": 'EAST',
                         "SOUTH_LEFT": 'EAST', "SOUTH_RIGHT": 'WEST',
                         "EAST_LEFT": 'NORTH', "EAST_RIGHT": 'SOUTH',
                         "WEST_LEFT": 'SOUTH', "WEST_RIGHT": 'NORTH' }.freeze
    attr_accessor :x, :y, :orientation
    # byebug
    def initialize
      @x = 0
      @y = 0
      @orientation = NORTH
      # @result = []
    end

    def execute(input)
      result = []
      input.each do |command|
        if command[0..4] == PLACE
          place_robot(command)
        elsif command == MOVE
          move_robot
        elsif [LEFT, RIGHT].include?(command)
          # Rotate robot 90 degree
          @orientation = DIRECTION_MAPPER["#{@orientation}_#{command}".to_sym]
        elsif command == 'REPORT'
          result.push(@x, @y, @orientation)
        end
      end
      result
    end

    def place_robot(command)
      cords = command.split(' ')[1].split(',')
      @x = cords[0].to_i
      @y = cords[1].to_i
      @orientation = cords[2]
    end

    def move_robot
      return unless valid_move?
      if @orientation == NORTH
        @y += 1
      elsif @orientation == SOUTH
        @y -= 1
      elsif @orientation == EAST
        @x += 1
      elsif @orientation == WEST
        @x -= 1
      end
    end

    def valid_move?
      (0...5) === @x && (0...5) === @y
    end
  end
end
