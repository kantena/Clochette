class Client < ActiveRecord::Base
  default_scope :order => 'nom'
  
  validates_presence_of :nom, :message => "ne peut etre vide"
  validates_presence_of :infos_projets ,:message => "doit au moins contenir le nom d'un projet sur lequel Kantena est en relation avec le client"

  validates_uniqueness_of :nom
end
