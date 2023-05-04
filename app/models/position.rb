class Position < ApplicationRecord
  #attr_accessor :position_name
  validates :position_name, presence: true

end
