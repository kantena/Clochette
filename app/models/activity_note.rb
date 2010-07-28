class ActivityNote < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user

  validates_inclusion_of :month, :in => 1..12
  validates_inclusion_of :year, :in => 0..Date.today.year

  def self.import user_id
    today = Date.today
    destroy_all(["month = ? and year = ? and user_id = ? ", today.month, today.year, user_id ])

    parser = AgendaParser.new
    user = User.find user_id

    parser.activity_note_list(user.name).each do |event|
      company = Customer.find_by_name(event.title)
      unless company.nil?
        activity_note = ActivityNote.new
        activity_note.user_id = user_id
        activity_note.working_days = event.end_time - event.start_time + 1
        activity_note.customer_id = company.id
        activity_note.month = today.month.to_i
        activity_note.year = today.year.to_i
        activity_note.save
      end
    end
  end
end
