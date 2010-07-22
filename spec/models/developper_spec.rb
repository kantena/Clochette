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
    assert_nothing_raised do
      Developper.create!(:name => 'robert')
    end
    assert_raise(ActiveRecord::RecordInvalid) do
      Developper.create!(:name => 'robert')
    end
  end
end
