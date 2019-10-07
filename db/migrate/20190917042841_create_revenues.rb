class CreateRevenues < ActiveRecord::Migration[5.2]
  def change
    create_table :revenues do |t|
      t.integer :tour_id
      t.float :price, default: 0.0

      t.timestamps
    end
  end
end
