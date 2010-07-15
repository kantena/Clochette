class Client < ActiveRecord::Base
  validates_presence_of :nom
  validates_uniqueness_of :nom
  validates_numericality_of :jours_a_facturer
  validates_inclusion_of :jours_a_facturer, :in => (0..31)
end
