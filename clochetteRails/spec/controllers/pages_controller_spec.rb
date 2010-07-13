require 'spec_helper'

describe PagesController do

  #Delete these examples and add some real ones
  it "should use PagesController" do
    controller.should be_an_instance_of(PagesController)
  end


  describe "GET 'facturation_clients'" do
    it "should be successful" do
      get 'facturation_clients'
      response.should be_success
    end
  end
end
