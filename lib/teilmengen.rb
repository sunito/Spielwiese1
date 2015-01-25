def alle_teilmengen(ausgangsarray)
  
  
  
  alle_teilarrays = []
  zahl = 0
  while zahl.to_s(2).length <= ausgangsarray.length do 
    teilarray = []
    # Neues Teilarray finden
    #Umwdlg. von Dual- in Binärsystem
    zahlbinaer = zahl.to_s(2)
    #Hilfsarray mit 0 befüllen
    hilfsarray = [] 
    ausgangsarray.length.times do #Hilfsarray mit 0 füllen
      hilfsarray << 0
    end
    #In Hilfsarray einsetzen 
    zahlbinaer.length.times do |i|
      if zahlbinaer[zahlbinaer.length-1-i].to_i == 1
        hilfsarray[hilfsarray.length-1-i] = zahlbinaer[zahlbinaer.length-1-i].to_i
      end
    end
    #Teilarray zusammenstellen
    (ausgangsarray.length).times do |x|
      if hilfsarray[x] == 1
        teilarray << ausgangsarray[x]
      end
      
    end
    alle_teilarrays << teilarray
    zahl += 1

  end
  alle_teilarrays
end


