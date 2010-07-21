class Customer < ActiveRecord::Base
  has_many :activities, :class_name => "ActivityNote"

  validates_presence_of :name
  validates_uniqueness_of :name

  def total_working_days
    activities.inject(0) do |sum, activity|
      sum += activity.working_days
    end
  end
end