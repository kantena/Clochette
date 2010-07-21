class ActivityNote < ActiveRecord::Base
  belongs_to :customer
  belongs_to :developper

end
