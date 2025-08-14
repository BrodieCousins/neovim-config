local art = require("brodie.ASCIIart")

--== VARIABLES ==--
local currentHour = tonumber(os.date("%H"))
local coffeeArt = art.coffee
local catArt = art.sleepingCat
local computerArt = art.computer

--== GREETING ==--
if currentHour >= 6 and currentHour < 12 then
	print("Good morning Brodie")
	print(coffeeArt)
elseif currentHour >= 12 and currentHour < 18 then
	print("Good afternoon!")
	print(computerArt)
else
	print("Good evening Brodie ᶻ 𝗓 𐰁")
	print(catArt)
end
