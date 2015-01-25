

def fakultaet(zahl)
	if zahl > 1 then
		return (fakultaet(zahl-1)*zahl) # Rekursiver Methodenaufruf
	elsif zahl == 1 then
		return 1 # "Abbruch" der Rekursion 
	else
		return 0 # 0! = 0
	end
end

puts fakultaet(3)
puts fakultaet(1)
puts fakultaet(0)