class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :goal_id
    end
  end
end
