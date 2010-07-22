class Customer < ActiveRecord::Base
  has_many :activities, :class_name => "ActivityNote"

  validates_presence_of :name
  validates_uniqueness_of :name

  def total_working_days
    sum = 0
    activities.each do |activity|
      sum += activity.working_days
    end
    sum
  end

  def current_working_days
    sum = 0
    activities.each do |activity|
      sum += activity.working_days if activity.month == Date.today.month && activity.year == Date.today.year
    end
    sum
  end
end