# coding: utf-8
require 'spec_helper'

describe Customer do
  before(:each) do
    @valid_attributes = {
      :name => "nom client"
    }
    @cust = Factory(:customer)
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end

  it "should validate the uniqueness of a client name" do
    assert_nothing_raised do
      User.create!(:name => 'Vinci')
    end
    assert_raise(ActiveRecord::RecordInvalid) do
      User.create!(:name => 'Vinci')
    end
  end

  it "should have a list of activity notes ??" do
    Factory(:activity_note, :customer => @cust)
    Factory(:activity_note, :customer => @cust)
    assert_kind_of ActivityNote, @cust.activities.first
    assert_equal 2, @cust.activities.size
  end


  it "should have a list of current activity notes ??" do
    Factory(:activity_note, :customer => @cust, :month => Date.today.month, :year => Date.today.year)
    Factory(:activity_note, :customer => @cust, :month => Date.today.month, :year => Date.today.year)
    assert_kind_of ActivityNote, @cust.current_activities.first
    assert_equal 2, @cust.current_activities.size
  end

  describe "#total_working_days" do
    it "should calculate total working days for all the records" do
      Factory(:activity_note, :customer => @cust, :working_days => 10)
      Factory(:activity_note, :customer => @cust, :working_days => 8)
      assert_equal 10+8, @cust.total_working_days
    end

    it "should calculate total working days for last month records" do
      past_month = Date.today.month - 1
      Factory(:activity_note, :customer => @cust, :working_days => 10,:month => past_month)
      Factory(:activity_note, :customer => @cust, :working_days => 8,:month => past_month)
      assert_equal 10+8, @cust.past_working_days(past_month)
    end
  end

  it "should calculate total work days for current period by default" do
    c1, c2 = Factory(:customer, :name => 'Vinci'), Factory(:customer, :name => 'Cour des comptes')
    dev1, dev2 = Factory(:kantenien, :name =>'nicolas'), Factory(:kantenien, :name => 'philippe')
    act1, act2 = Factory(:activity_note, :customer => c1, :user => dev1, :working_days => 10),\
      Factory(:activity_note, :customer => c2, :user => dev2, :working_days => 8)
    client = Factory(:customer, :activities => [act1, act2])
    assert_equal 18, client.total_working_days
  end
  
  describe "#current_working_days" do
    it "should compute the total of working days on the current month for a given customer" do
      Factory(:activity_note, :customer => @cust, :working_days => 1, :month => Date.today.month, :year => Date.today.year)
      Factory(:activity_note, :customer => @cust, :working_days => 23, :month => Date.today.month, :year => 2009)
      assert_equal 1, @cust.current_working_days
    end
  end

  describe "#global_activities_state" do

    it "should return false by default" do
      Factory(:activity_note, :customer => @cust)
      Factory(:activity_note, :customer => @cust)
      assert_equal false, @cust.global_activities_state
    end

    it "should compute true if all of state of activities are valid" do
      Factory(:activity_note, :customer => @cust, :month => Date.today.month, :year => Date.today.year, :validation_state => true)
      Factory(:activity_note, :customer => @cust, :month => Date.today.month, :year => Date.today.year, :validation_state => true)
      assert_equal true, @cust.global_activities_state
    end

    it "should return false if one state if activities for a given customer is false" do
      Factory(:activity_note, :customer => @cust, :month => Date.today.month, :year => Date.today.year, :validation_state => true)
      Factory(:activity_note, :customer => @cust, :month => Date.today.month, :year => Date.today.year, :validation_state => false)
      assert_equal false, @cust.global_activities_state
    end

  end

  describe "#current_working_days_yet_validated" do
    it "should compute the validated total of working days on the current month for a given customer" do
      Factory(:activity_note, :customer => @cust, :working_days => 1, :month => Date.today.month, :year => Date.today.year, :validation_state => false)
      Factory(:activity_note, :customer => @cust, :working_days => 23, :month => Date.today.month, :year => Date.today.year, :validation_state => true)
      assert_equal 23, @cust.current_working_days_yet_validated
    end
  end

  describe "liste les archives" do
    it " et liste les activités du mois passé" do
      past_month = Date.today.month - 1
      Factory(:activity_note, :customer => @cust, :working_days => 1, :month => past_month, :year => Date.today.year, :validation_state => false)
      Factory(:activity_note, :customer => @cust, :working_days => 23, :month => past_month, :year => Date.today.year, :validation_state => true)
      assert_equal 2, @cust.past_activity_notes(past_month).size
    end
  end
end
