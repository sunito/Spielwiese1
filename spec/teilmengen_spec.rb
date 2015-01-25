require 'rspec'

require_relative '../lib/teilmengen'
#require_relative '../lib/teil_arrays_m1'

class Array
  alias old_spaceship <=> 
  def <=> other
    if self.size == other.size 
      self.old_spaceship other
    else
      self.size <=> other.size
    end
  end
end


describe "#alle_teilmengen" do 

  it "sollte Array liefern" do
    expect( alle_teilmengen([1,2,3]) ).to be_a Array
  end

  def teste(a)
    erg = alle_teilmengen(a)
    erg = erg.map{|x| x.sort } rescue erg
    erg = erg.sort rescue erg
    erg
  end
  
  {
    [1]       => [[], [1]],
    [1,2]     => [[], [1], [2], [1, 2]],
    [1,2,3]   => [[], [1], [2], [3], [1, 2], [1, 3], [2, 3], [1, 2, 3]],
    [1,2,3,4] => [[], [1], [2], [3], [4], [1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4], [1, 2, 3], [1, 2, 4], [1, 3, 4], [2, 3, 4], [1, 2, 3, 4]]
  }.each do |array, erg|
    context array do
      it "sollte alle Teilmengen liefern" do
        expect( teste(array) ).to be == erg
      end
    end
  end

  it "sollte bei drei-elementiger Menge die acht Teilmengen liefern" do
    expect( teste([:a,:b,:c]) ).to be == [[], [:a], [:b], [:c], [:a, :b], [:a, :c], [:b, :c], [:a, :b, :c]]
  end

end
