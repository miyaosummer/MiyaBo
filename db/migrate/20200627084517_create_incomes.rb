class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :name
      t.integer :money
      t.string :comment
      t.datetime :start_time
      t.timestamps
    end
  end
end
