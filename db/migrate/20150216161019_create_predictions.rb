class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.string :name
      t.string :company

      t.timestamps null: false
    end
  end
end
