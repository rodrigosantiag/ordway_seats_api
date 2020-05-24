class CreateLayouts < ActiveRecord::Migration[6.0]
  def change
    create_table :layouts do |t|
      t.integer :rows
      t.integer :columns
      t.references :venue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
