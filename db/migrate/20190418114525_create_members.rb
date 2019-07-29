class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.bigint :num_member
      t.string :name
      t.bigint :rg
      t.date :date_birth
      t.string :sex
      t.date :date_baptism
      t.bigint :phone
      t.references :position, foreign_key: true
      t.references :church, foreign_key: true

      t.timestamps
    end
  end
end
