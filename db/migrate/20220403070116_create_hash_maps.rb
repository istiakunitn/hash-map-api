class CreateHashMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :hash_maps do |t|
      t.references :user, index:true, foreign_key: true
      t.string :name
      t.string :description
      t.json :data

      t.timestamps
    end
  end
end
