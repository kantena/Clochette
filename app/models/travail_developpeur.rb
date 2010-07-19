class TravailDeveloppeur < ActiveRecord::Base
  validates_presence_of :client, :message => "obligation d'indiquer pour quel client un d�veloppeur a travaille" 
  validates_presence_of :nom_developpeur, :message => "saisie obligatoire du bom du d�veloppeur" 
  validates_presence_of :mois, :message => "renseigner le champ mois obligatoirement" 
  validates_presence_of :annee, :message => "renseigner le champ annee obligatoirement"
  validates_inclusion_of :mois, :in => ['janvier','f�vrier','mars','avril','mai','juin','juillet','aout','septembre','octobre','novembre','decembre']
  validates_inclusion_of :annee, :in => (2009..3000)
end
