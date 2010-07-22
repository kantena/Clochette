require 'spec_helper'

describe ActivityNote do
  before(:each) do

    @valid_attributes = {
      :customer_id => 1,
      :developper_id => 1,
      :working_days => 10,
      :month => 06,
      :year => 2010
    }

  end

  it "should create a new instance given valid attributes" do
    ActivityNote.create!(@valid_attributes)
  end

  it "should have a client" do
    activity_note = Factory(:activity_note)
    assert_kind_of Customer, activity_note.customer
  end

  it "should have a Developper" do
    activity_note = Factory(:activity_note)
    assert_kind_of Developper, activity_note.developper
  end

  it "should expect a month among 1 and 12" do
    begin
      Factory(:activity_note, :month => -1)
      Factory(:activity_note, :month => 13)
    rescue
      assert true
    else
      assert false
    end
  end

  it "should expect a year less than current year" do
    begin
      Factory(:activity_note, :year => -2000)
      Factory(:activity_note, :year => 2300)
    rescue
      assert true
    else
      assert false
    end
  end

end
