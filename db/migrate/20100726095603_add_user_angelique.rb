class AddUserAngelique < ActiveRecord::Migration
  def self.up
    user = User.new
    user.name = "Angelique"
    user.function = "fairy"
    user.save
  end

  def self.down
    user = User.find_by_name "Angelique"
    user.destroy
  end
end
