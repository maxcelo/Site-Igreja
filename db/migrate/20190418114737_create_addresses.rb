class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :neighborhood
      t.integer :number
      t.integer :zip_code
      t.string :complement
      t.string :city
      t.string :state
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
