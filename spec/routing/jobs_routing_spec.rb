require "spec_helper"

describe JobsController do
  describe "routing" do

    it "routes to #index" do
      get("/jobs").should route_to("jobs#index")
    end

    it "routes to #show" do
      get("/jobs/1").should route_to("jobs#show", :id => "1")
    end

    it "routes to #flag" do
      get("/jobs/flag/1").should route_to("jobs#flag", :id => "1", :format => "json")
    end

  end
end
