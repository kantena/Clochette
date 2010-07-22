class ActivityNote < ActiveRecord::Base
  belongs_to :customer
  belongs_to :developper

  validates_inclusion_of :month, :in => (1..12)
  validates_inclusion_of :year, :in => (0..Date.today.year)

end
