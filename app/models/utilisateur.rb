class Utilisateur < ActiveRecord::Base
  validates_presence_of :login
  validates_uniqueness_of :login, :password
  
end
