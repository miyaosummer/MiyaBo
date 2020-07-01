class Asset < ApplicationRecord
  has_many :junres
  belongs_to :user

  validates :name,:money,       presence: true
end
