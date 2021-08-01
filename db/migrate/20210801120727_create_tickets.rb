class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :status
      t.datetime :due_date
      t.integer :user_id

      t.timestamps
    end
  end
end
