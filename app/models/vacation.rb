class Vacation < ActiveRecord::Base
  belongs_to :user

  validates_inclusion_of :month, :in => 1..12
  validates_inclusion_of :year, :in => 0..Date.today.year

  def self.list_for_current_month
    today = Date.today
    Vacation.find :all, :conditions => ["month = ? and year = ?", today.month, today.year]
  end

end
