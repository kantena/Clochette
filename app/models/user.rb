class User < ActiveRecord::Base
  has_many :activity_notes
  validates_presence_of :name
  validates_uniqueness_of :name

  def is_developper?
    function == "developper"
  end

  def import_from parser
    today = Date.today
    events = parser.activity_note_list(name)
    unless events.empty?
      ActivityNote.destroy_all(:month => today.month, :year => today.year, :user_id => self)
    end
    
    events.each do |event|
      company = Customer.find_by_name(event.title)
      unless company.nil?
        activity_note = ActivityNote.new
        activity_note.user = self
        activity_note.working_days = event.end_time - event.start_time + 1
        activity_note.customer = company
        activity_note.month = today.month.to_i
        activity_note.year = today.year.to_i
        activity_note.save
      end
    end
  end
end
