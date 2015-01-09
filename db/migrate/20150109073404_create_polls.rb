class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title
      t.string :image_a
      t.string :image_b
      t.string :caption_a
      t.string :caption_b
      t.integer :option_a_count
      t.integer :option_b_count
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
