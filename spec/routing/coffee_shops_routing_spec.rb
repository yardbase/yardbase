require "spec_helper"

describe CoffeeShopsController do
  describe "routing" do

    it "routes to #index" do
      get("/coffee_shops").should route_to("coffee_shops#index")
    end

    it "routes to #new" do
      get("/coffee_shops/new").should route_to("coffee_shops#new")
    end

    it "routes to #show" do
      get("/coffee_shops/1").should route_to("coffee_shops#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coffee_shops/1/edit").should route_to("coffee_shops#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coffee_shops").should route_to("coffee_shops#create")
    end

    it "routes to #update" do
      put("/coffee_shops/1").should route_to("coffee_shops#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coffee_shops/1").should route_to("coffee_shops#destroy", :id => "1")
    end

  end
end
