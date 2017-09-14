require "rails_helper"

describe TransfersController do
  describe "routing" do

    it "routes to #index" do
      get("/agreements/1/transfers").should route_to("transfers#index", :agreement_id => "1")
    end

    it "routes to #new" do
      get("/agreements/1/transfers/new").should route_to("transfers#new", :agreement_id => "1")
    end

    it "routes to #show" do
      get("/agreements/1/transfers/1").should route_to("transfers#show", :agreement_id => "1", :id => "1")
    end


    it "routes to #create" do
      post("/agreements/1/transfers").should route_to("transfers#create", :agreement_id => "1")
    end

  end
end
