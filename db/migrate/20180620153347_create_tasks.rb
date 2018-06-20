class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :event_id
      t.integer :user_id
      t.string :status
      t.timestamps
    end
  end
end
