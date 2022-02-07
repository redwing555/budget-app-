class User < ApplicationRecord

    has_many :groups, foreign_key: 'user_id'
    has_many :purchases, foreign_key: 'user_id'

    validates_uniqueness_of :name, :email
    validates :name, :email, presence: true
    validates :password, length: { minimum: 6 }
end
