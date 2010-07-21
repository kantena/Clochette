require 'spec_helper'

describe ActivityNote do
  before(:each) do

    @valid_attributes = {
      :customer_id => 1,
      :developper_id => 1,
      :working_days => 10
    }

    c1, c2 = Factory(:customer, :name => 'Vinci'), Factory(:customer, :name => 'Cour des comptes')
    dev1, dev2, dev3 = Factory(:kantenien, :name =>'nicolas'), \
      Factory(:kantenien, :name => 'philippe'), Factory(:kantenien, :name => 'damien')

    record1 = Factory(:activity_note, :customer => c1, :developper => dev2, :working_days => 10 )
    record2 = Factory(:activity_note, :customer => c1, :developper => dev3, :working_days => 5 )
    record3 = Factory(:activity_note, :customer => c2, :developper => dev1, :working_days => 25 )

  end

  it "should create a new instance given valid attributes" do
    ActivityNote.create!(@valid_attributes)
  end

  it "should have a client" do
    r = Factory(:activity_note)
    assert_kind_of Customer, r.customer
  end

end
