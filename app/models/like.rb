class Like < ApplicationRecord
    belongs_to :user

    belongs_to :like_target, polymorphic: true
end
