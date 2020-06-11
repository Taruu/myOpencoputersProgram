local component = require("component")
list_all_cell = {
    {"d84e5c05-5fba-4fea-b523-df103932002e","aea80191-5961-486a-a175-5b3b1e70895f","38c29be3-9d12-48d2-9147-09eac04bd3ad"},
    {"e8938c89-fd36-4d4c-b13a-414043937d2d","cdc87287-8ebc-4a5b-85ed-fb6630cd540c","c591cd76-0558-48cb-b7ea-2aeab05f3498"},
    {"b6ff451b-5eb8-4fb8-bf60-e1ff8d2f2b6d","85e3e65f-0a14-4e34-983f-facb613dc823","6fe772a2-d5b2-45af-ab70-34a68786135d"},
    {"c8f421d6-a31f-4c08-9bdd-286f6505080d","a43d2e3d-ba3a-4eb9-a588-5f02e7d96fe3","ac6969c0-9cd1-4356-ab2e-6ca6cf3c1c21"}
}

list_all_disel_generator = {"984e503d-983d-45d2-bc18-1b33ff169166","d0fd57a5-dae2-4b8d-ad17-8a2b84218806","d447e55e-763c-4696-b5f9-a04bbe2eb851"}
print(list_all_cell)
max_energy_in_cell = 2000000

function floor_to_step(what,step)
    return math.floor(what/step) * step
end

function sum(list)
    result = 0
    for item in ipairs(list) do
    result = result + list[item].getEnergyStored()
    end
    return result
end

for col_three in ipairs(list_all_cell) do
    for row_item in ipairs(list_all_cell[col_three]) do
        temp_str_id = list_all_cell[col_three][row_item]
        print(temp_str_id)
        list_all_cell[col_three][row_item] = component.proxy(component.get(temp_str_id))
    end
    --print("sum",floor_to_step(sum(list_all_cell[col_three])/3,0.01))
end

for col_three in ipairs(list_all_disel_generator) do
    temp_str_id = list_all_disel_generator[col_three]
    list_all_disel_generator[col_three] = component.proxy(component.get(temp_str_id)) 
    list_all_disel_generator[col_three].enableComputerControl(false)
    list_all_disel_generator[col_three].setEnabled(false)
end



