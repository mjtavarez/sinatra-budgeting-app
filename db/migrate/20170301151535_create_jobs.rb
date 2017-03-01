class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :industry_id
      t.integer :salary
    end
  end
end
