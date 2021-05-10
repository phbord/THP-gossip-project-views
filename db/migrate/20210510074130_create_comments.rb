class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :comment_type_id
      t.string :comment_type_type
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
