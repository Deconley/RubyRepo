class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :contact_id

      t.timestamps null: false
    end
  end
end
