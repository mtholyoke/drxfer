require "rails_helper"

describe TransfersController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/agreements/1/transfers")).to route_to("transfers#index", :agreement_id => "1")
    end

    it "routes to #new" do
      expect(get("/agreements/1/transfers/new")).to route_to("transfers#new", :agreement_id => "1")
    end

    it "routes to #show" do
      expect(get("/agreements/1/transfers/1")).to route_to("transfers#show", :agreement_id => "1", :id => "1")
    end


    it "routes to #create" do
      expect(post("/agreements/1/transfers")).to route_to("transfers#create", :agreement_id => "1")
    end

  end
end
