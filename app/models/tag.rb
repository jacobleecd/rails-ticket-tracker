class Tag < ApplicationRecord
  has_many :tags_tickets
  has_many :tickets, through: :tags_tickets

  scope :with_counts, -> {
      left_outer_joins(:taggings).select("tags.*, COUNT(taggings.id)").
        group("tags.id")
    }

  scope :alphabetical, -> { order("tags.name ASC") }
end