require 'spec_helper'

describe PagesController do

  #Delete these examples and add some real ones
  it "should use PagesController" do
    controller.should be_an_instance_of(PagesController)
  end


  describe "GET 'infos_facturation'" do
    it "should be successful" do
      get 'infos_facturation'
      response.should be_success
    end
  end
end
