require 'spec_helper'

describe User do

  it "verifie si l'utilisateur est un utisateur est un developpeur" do
    user = Factory(:kantenien, :name =>'nfe', :function => 'developper')
    assert_equal true, user.is_developper?
  end

  it "verifie si l'utilisateur est un utisateur n'est pas un developpeur" do
    user = Factory(:kantenien, :name =>'angélique', :function => 'faery')
    assert_equal false, user.is_developper?
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
