#ДАНО: Робот - в произвольной клетке ограниченного прямоугольной рамкой поля без внутренних перегородок и маркеров.
#РЕЗУЛЬТАТ: Робот - в исходном положении в центре косого креста (в форме X) из маркеров.
function main13!(r::Robot)
    putmarker!(r)
    upleft!(r)
    upright!(r)
    downleft!(r)
    downright!(r)
end

function upleft!(r::Robot) #идет налево и вверх, расстваляя маркеры, пока не наткнется на границу 
    x, y = 0, 0
    while isborder(r, West) == false && isborder(r, Nord) == false
          move!(r, West)
          x += 1

          move!(r, Nord)
          y += 1

          putmarker!(r)
    end

    while x > 0 && y > 0 #возвращает робота в исходное состояние
          move!(r, Ost)
          x -= 1

          move!(r, Sud)
          y -= 1
    end
end

function upright!(r::Robot) #идет наверх и влево, расставляя маркеры, пока не наткнется на границу
    x, y = 0, 0
    while isborder(r, Ost) == false && isborder(r, Nord) == false
          move!(r, Ost)
          x += 1

          move!(r, Nord)
          y += 1

          putmarker!(r)
    end

    while x > 0 && y > 0 #возвращает робота в исходное состояние 
          move!(r, West)
          x -= 1

          move!(r, Sud)
          y -= 1
    end
end

function downleft!(r::Robot) #идет вниз и влево, расставляя маркеры, пока не наткнется на границу
    x, y = 0, 0
    while isborder(r, West) == false && isborder(r, Sud) == false
          move!(r, West)
          x += 1

          move!(r, Sud)
          y += 1

          putmarker!(r)
    end

    while x > 0 && y > 0 #возвращает робота в исходное состояние
          move!(r, Ost)
          x -= 1

          move!(r, Nord)
          y -= 1
    end
end

function downright!(r::Robot) #идет вниз и вправо, расставляя маркеры, пока не наткнется на границу
    x, y = 0, 0
    while isborder(r, Ost) == false && isborder(r, Sud) == false
          move!(r, Ost)
          x += 1

          move!(r, Sud)
          y += 1

          putmarker!(r)
    end

    while x > 0 && y > 0 #возвращает робота в исходное состояние
          move!(r, West)
          x -= 1

          move!(r, Nord)
          y -= 1
    end
end
