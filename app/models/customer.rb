class Customer < ActiveRecord::Base
  has_many :activities, :class_name => "ActivityNote"
  has_many :current_activites, :class_name => "ActivityNote", :conditions => {:month => Date.today.month, :year => Date.today.year}

  validates_presence_of :name
  validates_uniqueness_of :name

  def total_working_days
    calculate_sum_for activities
  end

  def current_working_days
    calculate_sum_for current_activites
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