require 'rubygems'
require 'gcal4ruby'
require 'dm-core'

service = GCal4Ruby::Service.new
service.authenticate("mon_compte", "mon_pass")

calendar = GCal4Ruby::Calendar.find(service, "yaf%40kantena.com", :first)
#calendars = service.calendars

#calendars.each do |calendar|
  if calendar.editable
    puts calendar.id

#    events = GCal4Ruby::Event.find(calendar, "congé")
#    events.each do |event|
#      puts "#{event.title} du #{event.start} au #{event.end}"
#    end

    events = GCal4Ruby::Event.find(calendar, "à facturer")
    events.each do |event|
      puts "#{event.title} du #{event.start} au #{event.end}"
    end
  end
#end


DataMapper.setup({
  :adapter  => 'sqlite3',
  :database => 'db/crack.sqlite3'
})


class Event
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :start, DateTime
  property :end, DateTime
end

database.table_exists?(Event)


