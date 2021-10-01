class Robot
    
    #directions
    NORTH = 'NORTH'
    SOUTH = 'SOUTH'
    EAST = "EAST"
    WEST = "WEST"

    #commands
    PLACE = "PLACE"
    MOVE = "MOVE"
    LEFT = "LEFT"
    RIGHT = "RIGHT"

    def self.execute(input)
        
        result=[]
        x=0
        y=0
        current_direction = NORTH
        input.each do |c|
            if c[0..4] == PLACE
                cords = c.split(" ")[1].split(",")
                x = cords[0].to_i
                y = cords[1].to_i
                current_direction = cords[2]
            elsif c == MOVE
                if current_direction == NORTH
                    y+=1 if y>=0 && y<5
                elsif current_direction == SOUTH
                    y-=1 if y>=0 && y<5
                elsif current_direction == EAST
                    x+=1 if x>=0 && x<5
                elsif current_direction == WEST
                    x-=1 if x>=0 && x<5
                end
            elsif c == LEFT
                current_direction = if current_direction == NORTH
                        WEST
                elsif current_direction == SOUTH
                        EAST
                elsif current_direction == EAST
                        NORTH
                elsif current_direction == WEST
                        SOUTH
                end
            elsif c == RIGHT
                current_direction = if current_direction == NORTH
                        EAST
                        elsif current_direction == SOUTH
                            WEST
                        elsif current_direction == EAST
                            SOUTH
                        elsif current_direction == WEST
                            NORTH
                        end
            elsif c == "REPORT"
                result.push(x,y,current_direction)
            end
        end
        result
    end
end
