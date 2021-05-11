class Gossip < ApplicationRecord
    validates :title,
        presence: true,
        length: { minimum: 3, maximum: 14 }
    validates :content,
        presence: true

    belongs_to :user
    belongs_to :tag, optional: true
    has_many :likes
    has_many :comments, as: :comment_type
end
