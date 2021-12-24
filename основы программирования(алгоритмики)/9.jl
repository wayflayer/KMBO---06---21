#ДАНО: Где-то на неограниченном со всех сторон поле и без внутренних перегородок имеется единственный маркер.
# Робот - в произвольной клетке поля.
#РЕЗУЛЬТАТ: Робот - в клетке с тем маркером.
import HorizonSideRobots.move!

function num9!(r::Robot)

    mar = false
    
    a = 1
    s = 1
    k = 0

    while mar == false
        if ismarker(r) == false
            side = HorizonSide(mod(a-1, 4))
            move!(r, side, s)
            k += 1
        else
            mar = true
        end

        if (k == 2)
            k = 0
            s += 1
        end

        a += 1
    end

    return k
    return a
    return s

end    

function move!(r, side, num_steps)

    for _ in 1:num_steps 
        if ismarker(r) == false
            move!(r, side) 
        end
    end

end

inverse(side::HorizonSide) = HorizonSide(mod(Int(side) + 2, 4))