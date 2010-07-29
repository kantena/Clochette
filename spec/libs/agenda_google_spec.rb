# coding: utf-8
require 'spec_helper'

describe AgendaGoogle do
  it "on veut recuperer une liste d'événement à partir de l'agenda google" do
    list = []
    event = Event.new
    event.user = "nfe"
    event.title = "clochette@bastille"
    date = Date.civil(2010,7,26)
    event.start_time = date
    event.end_time = date
    list << event
    AgendaGoogle.any_instance.stubs(:list_event).returns(list)
    agenda = AgendaGoogle.new
    evenement = agenda.list_event[0]
    assert_equal "nfe", evenement.user
    assert_equal "clochette@bastille", evenement.title
    assert_equal date, evenement.start_time
    assert_equal date, evenement.end_time
  end
end
