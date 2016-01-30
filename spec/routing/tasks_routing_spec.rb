require "rails_helper"

RSpec.describe PersonalAccount::TasksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/personal_account/tasks").to route_to("personal_account/tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/personal_account/tasks/new").to route_to("personal_account/tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/personal_account/tasks/1").to route_to("personal_account/tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/personal_account/tasks/1/edit").to route_to("personal_account/tasks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/personal_account/tasks").to route_to("personal_account/tasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/personal_account/tasks/1").to route_to("personal_account/tasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/personal_account/tasks/1").to route_to("personal_account/tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/personal_account/tasks/1").to route_to("personal_account/tasks#destroy", :id => "1")
    end
  end
end
