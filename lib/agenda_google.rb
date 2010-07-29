require 'yaml'
class AgendaGoogle

  def list_event
    list = []
    calendars.each do |calendar|
      if calendar.editable
        events = calendar.events
        events.each do |event|
          result = Hash.new
          result[:user] = event.author_email
          result[:title] = event.title
          result[:start_time] = Date.civil(event.start_time.year,event.start_time.month,event.start_time.day)
          result[:end_time] = Date.civil(event.end_time.year,event.end_time.month,event.end_time.day)
          list << result
        end
      end
    end
    list
  end

  def calendars
    config = YAML::load(File.open("config/agenda_connection.yml"))
    service = GCal4Ruby::Service.new
    service.authenticate(config["user"], config["password"])
    service.calendars
  end
  
end


