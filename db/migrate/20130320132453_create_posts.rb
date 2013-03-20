class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :url
      t.string :text
      t.references :user
      t.timestamps
    end
  end
end
