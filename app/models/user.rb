class User < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  def is_developper?
    function == "developper"
  end
end
