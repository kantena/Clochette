class AddUserAngelique < ActiveRecord::Migration
  def self.up
    user = User.new
    user.name = "Angélique"
    user.function = "fairy"
    user.save
  end

  def self.down
    user = User.find_by_name "Angélique"
    user.destroy
  end
end
