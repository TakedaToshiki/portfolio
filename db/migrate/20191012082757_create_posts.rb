class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :images
      t.integer :user_id
      t.string :videos
      t.string :content
      t.string :youtube
      
      t.timestamps
    end
  end
end
