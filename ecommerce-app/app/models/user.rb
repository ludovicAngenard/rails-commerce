class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true

    has_one :buyer
    has_one :seller
end