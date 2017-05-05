class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :title
      t.text :introduction
      t.string :author
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
