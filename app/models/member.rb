class Member < ApplicationRecord
  belongs_to :position
  belongs_to :church
  has_one :address

end
