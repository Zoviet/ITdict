local output = assert(io.open('README.md', "w"))

local file = io.input('ITdict.md')
local text = io.read("*a") file:close()

local file = "ITdict.md"
local t= {}

for line in io.lines(file) do    
    local term, text = string.match(line, "%*%*%*(.+)%*%*%*(.+)")
    if term and text then
		table.insert(t, {term, text}) 
	end	
end

table.sort(t, function(a, b) return a[1] < b[1] end)

output:write('# Словарь ИТ для начинающих\n\n')

for _,val in pairs(t) do
	output:write('***'..val[1]..'*** '..val[2]..'\n\n')	
end

output:close()
