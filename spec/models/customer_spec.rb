require 'spec_helper'

describe Customer do
  before(:each) do
    @valid_attributes = {
      :name => "Valeur du nom"
    }
     
     
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end

  it "should have a list of activity notes ??" do
    c1, c2 = Factory(:customer, :name => 'Vinci'), Factory(:customer, :name => 'Cour des comptes')
    dev1, dev2 = Factory(:kantenien, :name =>'nicolas'), Factory(:kantenien, :name => 'philippe')
    act1, act2 = Factory(:activity_note, :customer => c1, :developper => dev1, :working_days => 10),\
      Factory(:activity_note, :customer => c2, :developper => dev2, :working_days => 8)
    client = Factory(:customer, :activities => [act1, act2])
    assert_kind_of ActivityNote, client.activities.first
    assert_equal 2, client.activities.size
  end

  it "should calculate total work days for current period by default" do
    c1, c2 = Factory(:customer, :name => 'Vinci'), Factory(:customer, :name => 'Cour des comptes')
    dev1, dev2 = Factory(:kantenien, :name =>'nicolas'), Factory(:kantenien, :name => 'philippe')
    act1, act2 = Factory(:activity_note, :customer => c1, :developper => dev1, :working_days => 10),\
      Factory(:activity_note, :customer => c2, :developper => dev2, :working_days => 8)
    client = Factory(:customer, :activities => [act1, act2])
    assert_equal 18, client.total_working_days
  end
end
