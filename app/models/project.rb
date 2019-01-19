class Project < ApplicationRecord
  has_many :tickets, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :user
  
  def open_tickets
    self.tickets.select do |t|
     ['new', 'blocked', 'in_progress'].include?(t.status) 
    end
  end
end