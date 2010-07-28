class AgendaGoogle

  def list_event
    service = GCal4Ruby::Service.new
    service.authenticate("Clochette@kantena.com", "clochette")
    calendars = service.calendars
    
    list = []
    calendars.each do |calendar|
      if calendar.editable
        events = calendar.events
        events.each do |event|
          evenement = Event.new
          evenement.user = event.author_email
          evenement.title = event.title
          evenement.start_time = Date.civil(event.start_time.year,event.start_time.month,event.start_time.day)
          evenement.end_time = Date.civil(event.end_time.year,event.end_time.month,event.end_time.day)
          list << evenement
        end
      end
    end
    list
  end
  
end


