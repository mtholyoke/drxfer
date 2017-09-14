require "rails_helper"

describe AgreementsController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/agreements")).to route_to("agreements#index")
    end

    it "routes to #new" do
      expect(get("/agreements/new")).to route_to("agreements#new")
    end

    it "routes to #show" do
      expect(get("/agreements/1")).to route_to("agreements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/agreements/1/edit")).to route_to("agreements#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/agreements")).to route_to("agreements#create")
    end

    it "routes to #update" do
      expect(put("/agreements/1")).to route_to("agreements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/agreements/1")).to route_to("agreements#destroy", :id => "1")
    end

  end
end
