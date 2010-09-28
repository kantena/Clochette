# coding: utf-8
require 'spec_helper'

describe User do
  it "est développeur si sa fonction l'indique" do
    user = Factory.create(:kantenien, :name =>'nfe', :function => 'developper')
    assert_equal true, user.is_developper?
  end

  it "n'est pas un développeur si sa fonction ne l'indique pas" do
    user = Factory.create(:kantenien, :name =>'angélique', :function => 'faery')
    assert_equal false, user.is_developper?
  end

  it "importe les activités à partir de l'agenda" do
    dev = Factory.create(:kantenien, :name =>'nfe', :function => 'developper')
    cdc = Factory.create(:customer, :name => 'CdC')

    list = []
    event = Event.new
    event.user = "nfe"
    event.title = "CdC"
    event.start_time = Date.civil(2010,7,1)
    event.end_time = Date.civil(2010,7,27)
    list << event
    parser = AgendaParser.new
    parser.stubs(:activity_note_list).returns(list)
    
    assert_difference('ActivityNote.count', 1) do
      dev.import_from parser
    end
  end

  it "importe les activités existantes sont supprimées et il existe au moins une activité pour le user" do
    coya = Factory.create(:customer, :name => 'Coya & Co')
    cdc = Factory.create(:customer, :name => 'CdC')
    last = Factory.create(:customer, :name => 'Une dernière compagnie')
    dev = Factory.create(:kantenien, :name =>'nfe', :function => 'developper')
    Factory.create(:activity_note, :customer => coya, :user => dev,
      :working_days => 10, :month => Date.today.month, :year => Date.today.year )
    Factory.create(:activity_note, :customer => cdc, :user => dev,
      :working_days => 5, :month => Date.today.month, :year => Date.today.year )
    Factory.create(:activity_note, :customer => last, :user => dev,
      :working_days => 25, :month => Date.today.month, :year => Date.today.year )

    list = []
    event = Event.new
    event.user = "nfe"
    event.title = "X"
    event.start_time = Date.civil(2010,7,1)
    event.end_time = Date.civil(2010,7,27)
    list << event
    parser = AgendaParser.new
    parser.expects(:activity_note_list).returns(list)
  
    assert_difference('ActivityNote.count', -3) do
      dev.import_from parser
    end
  end

  it "importe pas les activités dont la société est inconnue" do
    dev = Factory.create(:kantenien, :name =>'nfe', :function => 'developper')
    
    list = []
    event = Event.new
    event.user = "nfe"
    event.title = "X"
    event.start_time = Date.civil(2010,7,1)
    event.end_time = Date.civil(2010,7,27)
    list << event
    parser = AgendaParser.new
    parser.stubs(:activity_note_list).returns(list)

    assert_no_difference('ActivityNote.count') do
      dev.import_from parser
    end
  end
end
