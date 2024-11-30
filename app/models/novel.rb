class Novel < ApplicationRecord
  has_many :chapters, dependent: :destroy

  validates :title, presence: true
end
