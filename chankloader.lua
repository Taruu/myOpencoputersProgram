local ch = component.proxy(component.list("chunkloader")())
while true do
if ch.isActive() ~= true then
    ch.setActive(true)
else
    s = 1+1
end
end
