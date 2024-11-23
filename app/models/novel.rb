class Novel < ApplicationRecord
  has_many :chapters, dependent: destroy
end
