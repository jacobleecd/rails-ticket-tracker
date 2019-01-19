class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name, :body, :status
      t.integer :project_id
    end
  end
end
