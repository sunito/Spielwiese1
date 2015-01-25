class Multi
  def initialize(wiederholungen)
    @anzahl = wiederholungen
  end
  
  def malfolge_ausgeben(a)
    #i = 1  #Start der Multiplikationsfolge
    (1..@anzahl).each do |i|
      puts "#{a} * #{i} = #{a*i}"   #interpolation sinnvoll, da übersichtlicher
    end
  end
end

