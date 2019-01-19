class CreateTagsTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_tickets do |t|
      t.integer :ticket_id, :tag_id
    end
  end
end
