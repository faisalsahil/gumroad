require "spec_helper"

describe MyformsController do
  describe "routing" do

    it "routes to #index" do
      get("/myforms").should route_to("myforms#index")
    end

    it "routes to #new" do
      get("/myforms/new").should route_to("myforms#new")
    end

    it "routes to #show" do
      get("/myforms/1").should route_to("myforms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/myforms/1/edit").should route_to("myforms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/myforms").should route_to("myforms#create")
    end

    it "routes to #update" do
      put("/myforms/1").should route_to("myforms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/myforms/1").should route_to("myforms#destroy", :id => "1")
    end

  end
end
