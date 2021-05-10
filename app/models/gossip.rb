class Gossip < ApplicationRecord
    belongs_to :user
    belongs_to :tag, optional: true
    has_many :likes
    has_many :comments, as: :comment_type
end
