# encoding: UTF-8

require 'rspec'

require_relative '../lib/zahlen_aussprecher'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe ZahlenAussprecher do
  context "(im Einzeltest)" do
    before do
      @za = ZahlenAussprecher.new(4)
      @zahl1 =@za.zahl
    end
    
    it "sollte ein Zahleneussprecher sein" do
      expect( @za ).to be_a ZahlenAussprecher
      @za.should be_a ZahlenAussprecher  # andere Syntax, gleiche Bedeutung
    end  

    it "#to_s sollte die textuelle Form zurückgeben" do
      expect( @za.to_s ).to be == "vier"
      @za.to_s.should == "vier"          # andere Syntax, gleiche Bedeutung
    end  
    
    it "#zahl sollte die Basiszahl zurückgeben" do
      expect( @za.zahl ).to be == 4
      @za.zahl.should == 4          # andere Syntax, gleiche Bedeutung
    end  
    
    it "#to_i sollte die Basiszahl zurückgeben" do
      expect( @za.to_i ).to be == 4
    end  
    [[:Summe, :+, 'sieben'], [:Differenz, :-, 'eins'], [:Produkt, :*, 'zwölf'], [:Division, :/, 'eins']].each do |rechenart, operator, erg_string|
      context "#{rechenart} zweier Zahlenaussprecher" do
        before do
          @za2 = ZahlenAussprecher.new(3)
          @zahl2 =@za2.zahl
          @za_erg = @za.send(operator, @za2)
        end
        it "sollte ein Objekt der Klasse ZahlenAussprecher ergeben" do
          @za_erg.should be_a ZahlenAussprecher
        end
        it "sollte als zahl-Wert #{rechenart} der beiden Zahlenwerten ergeben" do
          @za_erg.zahl.should == @zahl1.send(operator, @zahl2)
        end
        it "sollte beim Aufruf von to_s #{rechenart} aus den beiden Zahlenwerten ergeben" do
          @za_erg.to_s.should == erg_string
        end
      end
    end
    it "== sollte bei anderer Basiszahl false liefern" do
      expect( @za == ZahlenAussprecher.new(3) ).to be == false
    end

    it "== sollte bei gleicher Basiszahl true liefern" do
      expect( @za == ZahlenAussprecher.new(4) ).to be == true
    end
  end

  context "(für einstellige Zahlen)" do
    %w[null eins zwei drei vier fünf sechs sieben acht neun].each_with_index do |zahlentext, zahl|
      it "#to_s für #{zahl} sollte #{zahlentext.inspect} liefern" do
        za = ZahlenAussprecher.new(zahl)
        za.to_s.should == zahlentext
      end
    end
  end  

  context "(für Zehner)" do
    %w[null zehn zwanzig dreißig vierzig fünfzig sechzig siebzig achtzig neunzig].each_with_index do |zahlentext, index|
      zahl = index * 10
      it "#to_s für #{zahl} sollte #{zahlentext.inspect} liefern" do
        za = ZahlenAussprecher.new(zahl)
        za.to_s.should == zahlentext
      end
    end
  end  

  context "(für einzelne Werte)" do
    { 
       7 => :sieben,
      11 => :elf,
      12 => :zwölf,
      18 => :achtzehn,
      42 => :zweiundvierzig,
      77 => :siebenundsiebzig
    }.each do |zahl, zahlentext_als_symbol|
      zahlentext = zahlentext_als_symbol.to_s
      context "ZahlenAussprecher.new(#{zahl})" do
        before do
          @za = ZahlenAussprecher.new(zahl)
        end
        it "#to_s sollte #{zahlentext.inspect} liefern" do          
          @za.to_s.should == zahlentext
        end
        it "== sollte bei gleicher Basiszahl true liefern" do          
          expect( @za == ZahlenAussprecher.new(zahl) ).to be == true
        end
      end
    end
  end  

  context "mit #ZA erzeugter ZahlenAussprecher" do
    before do
      @za_lang = ZahlenAussprecher.new(63)
      @za_kurz = ZA(63)
    end
    it "sollte der Langform (mit new) gleich sein" do
      expect( @za_kurz ).to be == @za_lang
    end
  end   
  
end