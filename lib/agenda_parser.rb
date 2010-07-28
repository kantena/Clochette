class AgendaParser
  def activity_note_list user = nil
    agenda = AgendaGoogle.new
    list_event = []

    current_month = Date.today.month
    agenda.list_event.each do |event|

      if event.start_time.month == current_month or event.end_time.month == current_month or (event.start_time.month < current_month and event.end_time.month > current_month)
        event.start_time = Date.civil(event.start_time.year,current_month,1) if event.start_time.month < current_month
        event.end_time = Date.civil(event.end_time.year,current_month, -1) if event.end_time.month > current_month    
        list_event << event if event.user == user
      end
    end
    list_event
  end
end


