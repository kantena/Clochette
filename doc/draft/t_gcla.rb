require 'rubygems'
require 'gcal4ruby'

service = GCal4Ruby::Service.new
service.authenticate("mon_login", "mon_pass")
calendars = service.calendars

calendars.each do |calendar|
  if calendar.editable
    puts calendar.id

    events = GCal4Ruby::Event.find(calendar, "congé")
    events.each do |event|
      puts "#{event.title} du #{event.start} au #{event.end}"
    end
  end
end


