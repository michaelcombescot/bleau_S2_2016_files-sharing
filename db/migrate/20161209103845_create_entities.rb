class CreateEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :entities do |t|
      t.string :name

      t.timestamps
    end

      add_index :users, :name, unique: true
  end
end
