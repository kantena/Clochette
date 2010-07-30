class Customer < ActiveRecord::Base
  has_many :activities, :class_name => "ActivityNote"
  has_many :current_activities, :class_name => "ActivityNote", :conditions => {:month => Date.today.month, :year => Date.today.year}
 
  validates_presence_of :name
  validates_uniqueness_of :name


  def total_working_days
    calculate_sum_for activities
  end

  def current_working_days
    calculate_sum_for current_activities
  end

  def past_working_days month
    calculate_sum_for past_activity_notes(month)
  end

  def current_working_days_yet_validated
    sum = 0
    current_activities.each do |activity|
      sum += activity.working_days if activity.validation_state
    end
    sum
  end

  def global_activities_state
    state = true
    state = false if current_activities.size == 0
    current_activities.each do |activity|
      state &&= activity.validation_state
    end
    state
  end

  def past_activity_notes month
    ActivityNote.find :all,:conditions => ["month = ? and year = ? and customer_id = ?", month, Date.today.year,self]
  end

  private
  def calculate_sum_for activity_list
    sum = 0
    activity_list.each do |activity|
      sum += activity.working_days
    end
    sum
  end
end