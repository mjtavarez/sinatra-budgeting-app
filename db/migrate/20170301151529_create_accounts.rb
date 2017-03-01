class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :due_date
      t.integer :interest
      t.integer :balance
      t.integer :user_id
      t.timestamps
    end
  end
end
