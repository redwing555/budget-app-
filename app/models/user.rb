class User < ApplicationRecord

    has_many :groups, foreign_key: 'user_id'
    has_many :purchases, foreign_key: 'user_id'
end
