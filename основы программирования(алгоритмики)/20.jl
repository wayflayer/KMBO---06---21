function num20!(r::Robot)

    gg1 = 1
    gg2 = 1
    
    while ((gg1 == 1) || ( gg2 == 1))
        moves!(r, Sud)
        if isborder(r, Sud) == true
            gg1 = round_borders!(r, Sud)
        end

        moves!(r, West)
        if isborder(r, West) == true
            gg2 = round_borders!(r, West)
        end
    end

    c = 0
    side = Ost
    gg = 1

    while (gg == 1)
        c += border_amount(r, side, 0)
        if (isborder(r, Nord) == false)
            move!(r, Nord)
            side = inverse(side)
        else
            gg = round_borders!(r, Nord)
            side = inverse(side)
        end    
        c += border_amount(r, side, 0)
    end
    
    c += border_amount(r, side,0)
    return c

end

function border_amount(r::Robot, side::HorizonSide, a::Int)

    f = 1

    while (f == 1)
        if isborder(r, Sud) == true
            a += 1
        end
        if isborder(r, side) == false
            move!(r, side)
        else
            f = round_borders!(r, side)
        end
    end

    return a

end