class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :describtion
      t.integer :age
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
