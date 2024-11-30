class Chapter < ApplicationRecord
  belongs_to :novel
  validates :title, :main_text, presence: true
end