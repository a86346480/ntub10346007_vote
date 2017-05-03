class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :candidate_id
      t.integer :
      t.string :ip_address
      t.string :

      t.timestamps
    end
  end
end
