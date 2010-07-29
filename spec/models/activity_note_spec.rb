# coding: utf-8
require 'spec_helper'

describe ActivityNote do
  before(:each) do

    @valid_attributes = {
      :customer_id => 1,
      :user_id => 1,
      :working_days => 10,
      :month => 6,
      :year => 2010,
      :validation_state => false
    }

    c1 = Factory(:customer, :name => 'Vinci')
    c2 = Factory(:customer, :name => 'Cour des comptes')
    dev1, dev2, dev3 = Factory(:kantenien, :name =>'nicolas'), Factory(:kantenien, :name => 'philippe'), Factory(:kantenien, :name => 'damien')

    Factory(:activity_note, :customer => c1, :user => dev2, :working_days => 10 )
    Factory(:activity_note, :customer => c1, :user => dev3, :working_days => 5 )
    Factory(:activity_note, :customer => c2, :user => dev1, :working_days => 25 )

  end

  it "should create a new instance given valid attributes" do
    ActivityNote.create!(@valid_attributes)
  end

  it "should have a client" do
    activity_note = Factory(:activity_note)
    assert_kind_of Customer, activity_note.customer
  end

  it "should have a User" do
    activity_note = Factory(:activity_note)
    assert_kind_of User, activity_note.user
  end

  it "should expect a month among 1 and 12" do
    assert_raise(ActiveRecord::RecordInvalid) do
      ActivityNote.create!(:month => 0)
    end
    assert_raise(ActiveRecord::RecordInvalid) do
      ActivityNote.create!(:month => 13)
    end
  end

  it "should expect a year less than current year" do
    assert_raise(ActiveRecord::RecordInvalid) do
      ActivityNote.create!(:year => -2000)
    end
    assert_raise(ActiveRecord::RecordInvalid) do
      ActivityNote.create!(:year => 2040)
    end
  end
end
