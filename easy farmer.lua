local robot = require("robot")
local comp = require("computer")

function None()
end

function harvesting_now()
    robot.swingDown()
    robot.placeDown()
end

function unload()
    for c = 2, 16 do
      robot.select(c)
      if robot.count() > 0 then
        robot.drop()
      else
        robot.select(1)
        break
      end
    end
  end

function while_go(harvesting)
    if harvesting then 
        ext_func = harvesting_now
    else
        ext_func = None 
    end
    status = true
    while status == true do
        ext_func()
        status = robot.forward()
    end
end

function go_to_home_right()
    robot.turnLeft()
    while_go(false)
    robot.turnLeft()
    while_go(false)
    robot.turnRight()
    robot.forward()
end

function go_to_home_left()
    robot.turnAround()
    while_go(false)
    robot.turnRight()
    robot.forward()
end

function go_all()
    robot.forward()
    harvesting_now()
    work = true
    col = 1
    while work do
        print("colnow",col)
        while_go(true)
        if col % 2 == 0 then
            robot.turnRight()
            work = robot.forward()
            if work then
                robot.turnRight()
                last = true
            end
        else
            robot.turnLeft()
            work = robot.forward()
            if work then
                robot.turnLeft()
                last = nil
            end
        end
        col = col + 1
    end

    if last then
        go_to_home_right()
    else
        go_to_home_left()
    end
end

function start()
    robot.select(1)
    while true do
        go_all()
        if robot.count(1) > 45 then
            unload()
        end
        robot.turnAround()
        for i=1, 10 do
            os.sleep(360)
            print((10*i)..'%')
          end
    end
end
robot.u
start()
--go_to_home()