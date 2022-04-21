require_relative '../lib/scrappeur'

describe "scrapping" do
    it "returns an array of hash" do
      expect(scrapping).to_not be_nil
      expect(scrapping).to be_a(Array)
    end
  
    it "should contain at least 10 cryptos with values" do
        expect(scrapping.length).to be > 10
        expect(scrapping.reduce({},:merge)).to include('DAIDai')
        expect(scrapping.reduce({},:merge)).to include('NEARNEAR Protocol')
        expect(scrapping.reduce({},:merge)).to include('LUNATerra')
    end
  end