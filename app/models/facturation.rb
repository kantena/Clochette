class Facturation < ActiveRecord::Base
  validates_presence_of :date_creation , :message => "entrer au mois une date de creation de la facture"
  validates_presence_of :client, :message => "une facture doit se rattacher à un client" 
  validates_inclusion_of :nb_jours_a_facturer, :in => (0..31)
end
