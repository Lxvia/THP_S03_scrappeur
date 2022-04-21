require_relative "../lib/mairie"

describe "get_townhall_email method" do
    it "should return an array of hash" do
      expect(get_townhall_email("http://annuaire-des-mairies.com/95/jagny-sous-bois.html")).to_not be_nil
      expect(get_townhall_email("http://annuaire-des-mairies.com/95/pontoise.html")).to be_a(Hash)
    end
  
  end

describe "get_townhall_urls" do
  it "should return an array of hash" do
     expect(get_townhall_urls).not_to be_nil
     expect(get_townhall_urls).to be_a(Array)
     expect(get_townhall_urls.length).to be > 10
  end

  it "should contain urls" do
     expect(get_townhall_urls).to include("https://www.annuaire-des-mairies.com/95/hedouville.html")
  end
end

describe "perform" do 
  it "should return an array of hash" do
     expect(perform).not_to be_nil
     expect(perform ).to be_a(Array)
     expect(perform.length).to be > 50
     expect(perform).to include('{"SAINT-LEU-LA-FORET"=>"mairie@saint-leu-la-foret.fr"}')
     expect(perform).to include('{"FREMECOURT"=>"mairiefremecourt@orange.fr"}')
  end
end
   