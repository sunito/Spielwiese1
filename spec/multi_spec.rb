require 'rspec'

require_relative '../lib/multi'

describe Multi do
  before do
    @multi = Multi.new(4)
  end

  it "sollte die Malfolgen-Tabelle ausgeben" do
    erwartetes_erg = <<TextEnde
7 * 1 = 7
7 * 2 = 14
7 * 3 = 21
7 * 4 = 28
TextEnde
    expect { @multi.malfolge_ausgeben(7) }.to output( erwartetes_erg ).to_stdout
  end
  
end

