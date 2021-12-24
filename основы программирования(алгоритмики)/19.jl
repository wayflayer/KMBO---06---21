import HorizonSideRobots.move!

function num19!(r::Robot)

    marker = false

    x = 1
    c = 1
    n = 0

    while marker == false
        if ismarker(r) == false
            side = HorizonSide(mod(x - 1, 4))
            move!(r, side, c)
            n += 1
        else
            marker = true
        end
        if (n == 2)
            n = 0
            c += 1
        end
        x += 1
    end

end    

function move!(r, side,num_steps)

    for _ in 1:num_steps 
        if ismarker(r) == false
            if isborder(r, side) == false
                move!(r, side)
            else
                border!(r, side)
            end 
        end
    end

end

function border!(r::Robot, side::HorizonSide)   
  
    x = 0
    gg = 1

    while isborder(r, side) == true
        if isborder(r, next(side)) == true
            gg = 0
            break
        end
        move!(r, next(side))
        x += 1
    end

    if (gg != 0)
        move!(r, side)
        while isborder(r, prev(side)) == true
            move!(r, side)
        end
        move!(r, prev(side))
        moves!(r, prev(side), x - 1)
    else
        moves!(r, prev(side), x)
    end

    return gg

end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))