class Floor < ApplicationRecord
  belongs_to :building
  has_many :rooms, dependent: :destroy
end
