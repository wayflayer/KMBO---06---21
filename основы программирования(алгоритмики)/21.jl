function num21!(r::Robot)

    gg1 = 1
    gg2 = 1
    
    while ((gg1 == 1) || ( gg2 == 1))
        moves!(r, Sud)
        if isborder(r, Sud) == true
            gg1 = border!(r, Sud)
        end

        moves!(r, West)
        if isborder(r, West) == true
            gg2 = border!(r, West)
        end
    end

    c =- 2 

    side = Ost
    gg = 1

    while (gg == 1)
        c += border_count(r, side, 0)
        if (isborder(r, Nord) == false)
            move!(r, Nord)
            side = inverse(side)
        else
            gg = border!(r, Nord)
            side = inverse(side)
        end    
    end
    
    c += border_count(r, side, 0)  

    return c

end

function border_count(r::Robot, side::HorizonSide, a::Int)

    f = 1

    while (f == 1)
        if isborder(r, Sud) == true
            a += 1
        end
        if isborder(r, side) == true
            a += 1
        end

        if isborder(r, side) == false
            move!(r, side)
        else
            f = border!(r, side)
        end
    end

    a += 2

    return a

end

function border!(r::Robot, side::HorizonSide)   
  
    a = 0
    gg = 1

    while isborder(r, side) == true
        if isborder(r, next(side)) == true
            gg = 0
            break
        end
        move!(r, next(side))
        a += 1
    end

    if (gg != 0)
        move!(r, side)
        while isborder(r, prev(side)) == true
            move!(r, side)
        end
        move!(r, prev(side))
        moves!(r, prev(side) ,a - 1)
    else
        moves!(r, prev(side), a)
    end

    return gg

end