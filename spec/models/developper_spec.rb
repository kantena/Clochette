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

  it "should validate the uniqueness of a developper's name" do
    begin
      Factory(:kantenien, :name => 'robert')
      Factory(:kantenien, :name => 'robert')
    rescue
      assert true
    else
      assert false
    end
  end
end
