local r = component.proxy(component.list("robot")())
while true do
r.move(1)
computer.beep(20,1)
end