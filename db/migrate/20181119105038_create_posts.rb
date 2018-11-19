class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :author
      t.string :title
      t.boolean :published, default: false
      t.text :text
      t.string :slug
      t.timestamps
    end
  end
end
