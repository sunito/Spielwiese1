def alle_teilmengen(ausgangsarray)
  
  
  
  alle_teilarrays = []
  zahl = 0
  while zahl.to_s(2).length <= ausgangsarray.length do 
    teilarray = []
    # Neues Teilarray finden
    #Umwdlg. von Dual- in Binärsystem
    zahlbinaer = zahl.to_s(2)
    #Hilfsarray mit 0 befüllen

=begin
    hilfsarray = [] 
    ausgangsarray.length.times do #Hilfsarray mit 0 füllen
      hilfsarray << 0
    end
=end
    #In Hilfsarray einsetzen 
    #zahlbinaer.length.times do |i|
#      if zahlbinaer[zahlbinaer.length-1-i].to_i == 1
      #  hilfsarray[hilfsarray.length-1-i] = zahlbinaer[zahlbinaer.length-1-i].to_i
     # end
 #   end
    #Teilarray zusammenstellen
    abst = ausgangsarray.length  - zahlbinaer.length
    (ausgangsarray.length).times do |x|
      
      #i = hilfsarray.length - 1 - x
      #x = hilfsarray.length - 1 - i
      if x >= abst
        #hilfsarray[x] = zahlbinaer[x - abst].to_i
        #hilfsarray[x] = 
        if zahlbinaer[x - abst].to_i == 1
          teilarray << ausgangsarray[x]
          #teilarray = [ausgangsarray[x]] + teilarray
        end
      end
      
    end
    alle_teilarrays << teilarray
    zahl += 1

  end
  alle_teilarrays
end


