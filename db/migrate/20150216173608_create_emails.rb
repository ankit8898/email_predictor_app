class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.belongs_to :prediction
      t.string :email
      t.timestamps null: false
    end
  end
end
