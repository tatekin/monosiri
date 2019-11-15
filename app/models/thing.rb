class Thing < ApplicationRecord
  belongs_to :category

  validates :name, :number, :category_id, presence: true
end
