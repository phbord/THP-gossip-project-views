class User < ApplicationRecord
    has_secure_password

    validates :first_name,
    presence: true
    validates :last_name,
    presence: true
    validates :describtion,
    presence: true,
    length: { minimum: 3, maximum: 14 }
    validates :email,
        presence: true,
        uniqueness: true,
        format: {
            with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
            message: "email adress please"
        }
    validates :password_digest,
        presence: true,
        length: { minimum: 6 }

    belongs_to :city
    has_many :gossips
    has_many :likes
    has_many :comments, as: :comment_type
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
end
