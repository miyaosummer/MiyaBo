class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :money
      t.references :user, null:false,foreign_key: true
      t.timestamps
    end
  end
end
