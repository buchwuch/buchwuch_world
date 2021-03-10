class Article < ApplicationRecord
    # Scopes
    scope :alphabetical, -> { order('title') }
    scope :active, -> { where('active = ?', true) }
end
