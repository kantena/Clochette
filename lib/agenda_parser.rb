class AgendaParser

  def initialize agenda = nil
    @agenda = agenda
  end

  def activity_note_list user = nil
    list = []
    current_month = Date.today.month

    @agenda.list_event.each do |hash|
      event = Event.new
      event.start_time = hash[:start_time]
      event.end_time = hash[:end_time]
      event.user = hash[:user]
      event.title = hash[:title]
      if event.start_time.month == current_month or event.end_time.month == current_month or (event.start_time.month < current_month and event.end_time.month > current_month)
        event.start_time = Date.civil(event.start_time.year,current_month,1) if event.start_time.month < current_month
        event.end_time = Date.civil(event.end_time.year,current_month, -1) if event.end_time.month > current_month
        list << event if event.user == user
      end
    end
    list
  end
end


