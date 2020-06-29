class CreateJunres < ActiveRecord::Migration[5.2]
  def change
    create_table :junres do |t|
      t.string :name, unique: true
      t.timestamps
    end
  end
end
