class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.string :name
      t.string :email
      t.string :company

      t.timestamps null: false
    end
  end
end
