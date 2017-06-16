class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.text :name
      t.text :stu_number
      t.integer :score
      t.text :grade

      t.timestamps
    end
  end
end
