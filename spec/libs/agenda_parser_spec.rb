require 'spec_helper'

describe AgendaParser do
  describe "recupere la liste des evenements d'un equipier pour le mois en cours" do

    it "cas pour un seul evenement" do
      list = []
      event = Hash.new
      event[:user] = "yaf@kantena.com"
      event[:title] = "matis@bastille"
      date = Date.civil(2010,7,27)
      event[:start_time] = date
      event[:end_time] = date
      list << event
      agenda = AgendaGoogle.new
      agenda.stubs(:list_event).returns(list)

      parser = AgendaParser.new agenda
      result = parser.activity_note_list "yaf@kantena.com"
      assert_equal 1, result.size
    end

    it "cas pour deux evenements" do
      list = []
      event = Hash.new
      event[:user] = "yaf@kantena.com"
      event[:title] = "matis@bastille"
      date = Date.civil(2010,7,27)
      event[:start_time] = date
      event[:end_time] = date
      list << event
      list << event

      agenda = AgendaGoogle.new
      agenda.stubs(:list_event).returns(list)
      parser = AgendaParser.new agenda
      result = parser.activity_note_list "yaf@kantena.com"
      assert_equal 2, result.size
    end

    it "cas pour un aucun evenement" do
      list = []
      agenda = AgendaGoogle.new
      agenda.stubs(:list_event).returns(list)
      parser = AgendaParser.new agenda
      assert_equal 0, parser.activity_note_list.size
    end

    it "cas sans evenement" do
      list = []
      event = Hash.new
      event[:user] = "yaf@kantena.com"
      event[:title] = "matis@bastille"
      date = Date.civil(2010,7,27)
      event[:start_time] = date
      event[:end_time] = date
      list << event
      agenda = AgendaGoogle.new
      agenda.stubs(:list_event).returns(list)
      parser = AgendaParser.new agenda
      result = parser.activity_note_list "nfe@kantena.com"
      assert_equal 0, result.size
    end

    it "cas sans evenement pour l'equipier selectionné et le mois en cours" do
      list = []
      agenda = AgendaGoogle.new
      agenda.stubs(:list_event).returns(list)
      parser = AgendaParser.new agenda
      result = parser.activity_note_list "yaf@kantena.com"
      assert_equal 0, result.size
    end

    it "cas avec un evenement ayant commencé avant le mois en cours et finissant pendant le mois en cours, la date de début doit contenir le premier jour du mois" do
      list = []
      event = Hash.new
      event[:user] = "yaf@kantena.com"
      event[:title] = "matis@bastille"
      event[:start_time] = Date.civil(2010,5,27)
      event[:end_time] = Date.civil(2010,7,27)
      list << event
      agenda = AgendaGoogle.new
      agenda.stubs(:list_event).returns(list)
      parser = AgendaParser.new agenda
      result = parser.activity_note_list "yaf@kantena.com"
      assert_equal Date.civil(2010,7,1), result[0].start_time
    end

    it "cas avec un evenement finissant après le mois en cours et commençant pendant le mois en cours, la date de fin doit contenir le dernier jour du mois" do
      list = []
      event = Hash.new
      event[:user] = "yaf@kantena.com"
      event[:title] = "matis@bastille"
      event[:start_time] = Date.civil(2010,7,27)
      event[:end_time] = Date.civil(2010,8,27)
      list << event
      agenda = AgendaGoogle.new
      agenda.stubs(:list_event).returns(list)
      parser = AgendaParser.new agenda
      result = parser.activity_note_list "yaf@kantena.com"
      assert_equal Date.civil(2010,7,31), result[0].end_time
    end

    it "cas avec un evenement a cheval sur le mois en cours. les dates de début et de fin doivent correspondre aux dates limites du mois" do
      list = []
      event = Hash.new
      event[:user] = "yaf@kantena.com"
      event[:title] = "matis@bastille"
      event[:start_time] = Date.civil(2010,6,27)
      event[:end_time] = Date.civil(2010,8,27)
      list << event
      agenda = AgendaGoogle.new
      agenda.stubs(:list_event).returns(list)
      parser = AgendaParser.new agenda
      result = parser.activity_note_list "yaf@kantena.com"
      assert_equal Date.civil(2010,7,1), result[0].start_time
      assert_equal Date.civil(2010,7,31), result[0].end_time
    end
  end
end