class AjoutChampsTravailDeveloppeurs < ActiveRecord::Migration
  def self.up
    add_column :travail_developpeurs, :mois, :string
    add_column :travail_developpeurs, :annee, :integer
  end

  def self.down
  end
end
