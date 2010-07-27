class VacationNote < ActiveRecord::Base
  belongs_to :user

  validates_inclusion_of :month, :in => 1..12
  validates_inclusion_of :year, :in => 0..Date.today.year
end
