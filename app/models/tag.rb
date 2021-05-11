class Tag < ApplicationRecord
    validates :title,
    presence: true

    has_many :gossips
end
