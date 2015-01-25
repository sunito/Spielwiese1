# encoding: utf-8

class ZahlenAussprecher 
  EINER_TEXT = ["null", "eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", "neun"]
  ZEHNER_TEXT = ["null", "zehn", "zwanzig", "dreißig", "vierzig", "fünfzig", "sechzig", "siebzig", "achtzig", "neunzig"]
  
  attr_reader :zahl

  def initialize(zahl)
      @zahl = zahl
      @ZahlenAussprecher = zahl.to_s
      @einer  = @ZahlenAussprecher[1].to_i
      @zehner = @ZahlenAussprecher[0].to_i
  end
  
  def to_i
    @zahl.to_i
  end

  def to_s
    if @zahl < 10 then   # Zahl hat keinen "Zehner"
      EINER_TEXT[@zahl]
    else   # Zahl hat Zehner
      if @einer != 0 then
        zahlaustext = EINER_TEXT[@einer]   # Einer zum String hinzufügen
        if @zehner == 1 then #Zehner ist zehn, kein und als Verbindung
          if @einer == 1 then
            "elf"
          elsif @einer == 2 then 
            "zwölf"
          else
            zahlaustext + ZEHNER_TEXT[@zehner]
          end
        else 
          zahlaustext + 'und' + ZEHNER_TEXT[@zehner]
        end
      else 
        ZEHNER_TEXT[@zehner]
      end
    end
  end
        
  def +(summand)
    ZahlenAussprecher.new(self.zahl + summand.to_i)
  end
  def ==(zahl)
    self.zahl == zahl.zahl  
  end
  def -(subtrahend)
    ZahlenAussprecher.new(self.zahl - subtrahend.to_i)
  end
  def *(faktor)
    ZahlenAussprecher.new(self.to_i * faktor.to_i)
  end
  def /(divisor)
    ZahlenAussprecher.new((self.zahl / divisor.zahl).to_i)
  end
end

def ZA(zahl)
  ZahlenAussprecher.new(zahl)
end