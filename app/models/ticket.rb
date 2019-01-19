class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :tags_tickets, dependent: :destroy
  has_many :tags, through: :tags_tickets
  
  STATUSES = %w(new blocked in_progress fixed)
  validates :status, inclusion: { in: STATUSES,
    message: "Status must be either 'new', 'blocked', 'in_progress' or 'fixed" }

  def add_tags(tags)
    tags.each do |tag_id|
      self.tags << Tag.find(tag_id) if !tag_id.empty?
    end
  end

  def has_tag?(tag_id)
    self.tags.map { |t| t.id }.include?(tag_id)
  end
end