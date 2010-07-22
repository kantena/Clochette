require 'spec_helper'

describe Customer do
  before(:each) do
    @valid_attributes = {
      :name => "nom client"
    }
     
    @customer1, @customer2 = Factory(:customer, :name => 'Vinci'), Factory(:customer, :name => 'Cour des comptes')
    @developper1, @developper2 = Factory(:kantenien, :name =>'nicolas'), Factory(:kantenien, :name => 'philippe')
    @activity_note1 = Factory(:activity_note, :customer => @customer1, :developper => @developper1, :working_days => 10, :month => 07, :year => 2010 )
    @activity_note2 = Factory(:activity_note, :customer => @customer2, :developper => @developper2, :working_days => 8, :month => 07, :year => 2010 )
  end

  it "should create a new instance given valid attributes" do
    Customer.create!(@valid_attributes)
  end

  it "should validate the uniqueness of a client name" do
    begin
      Factory(:customer, :name=> 'Vinci')
      Factory(:customer, :name=> 'Vinci')
    rescue
      assert true
    else
      assert false
    end
  end

  it "should have a list of activity notes ??" do    

   
    client = Factory(:customer, :activities => [@activity_note1, @activity_note2])
    assert_kind_of ActivityNote, client.activities.first
    assert_equal 2, client.activities.size
  end

  describe "#total_working_days" do

    it "should calculate total working days for all the records" do

      client = Factory(:customer, :activities => [@activity_note1, @activity_note2])
      assert_equal 18, client.total_working_days

    end
  end

  describe "#current_working_days" do

    it "should compute the total of working days on the current month for a given customer" do

      act_note1 = Factory(:activity_note, :customer => @customer1, :developper => @developper1,\
          :working_days => 10, :month => Date.today.month, :year => Date.today.year)
      client = Factory(:customer, :activities => [act_note1])
      assert_equal 10, client.current_working_days

      act_note2 = Factory(:activity_note, :customer => @customer1, :developper => @developper1,\
          :working_days => 10, :month => Date.today.month, :year => 2009)
      client = Factory(:customer, :name => 'GE', :activities => [act_note2])
      assert_equal 0, client.current_working_days
    end
  end
 

end
