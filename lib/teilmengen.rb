def alle_teilmengen(array)
  i = array.size
  array = array.dup
  array.sort!
  alle_teilarrays = [[]]
  while i > 0 do
    i -= 1
    alle_teilarrays << [array[i]]
    if i > 1
      z = i
      teilarray = []
      while z > 0 do
        z -= 1
        teilarray << array[z]
      end
      alle_teilarrays << teilarray
    end
  end
  alle_teilarrays 
end 




