# coding: utf-8
require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :name => "le nom du dev"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  it "should validate the uniqueness of a user's name" do
    assert_nothing_raised do
      User.create!(:name => 'robert')
    end
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create!(:name => 'robert')
    end
  end
end
