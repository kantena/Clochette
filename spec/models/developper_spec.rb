require 'spec_helper'

describe Developper do
  before(:each) do
    @valid_attributes = {
      :name => "le nom du dev"
    }
  end

  it "should create a new instance given valid attributes" do
    Developper.create!(@valid_attributes)
  end
end
