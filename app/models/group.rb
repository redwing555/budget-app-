class Group < ApplicationRecord
  has_and_belongs_to_many :operations
  belongs_to :user

  validates :name, :icon, presence: true

  def total_amount
    operations.sum(:amount)
  end
end
