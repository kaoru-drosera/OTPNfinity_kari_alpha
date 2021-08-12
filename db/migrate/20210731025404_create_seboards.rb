class CreateSeboards < ActiveRecord::Migration[6.1]
  def change
    create_table :seboards do |t|
      t.references :sampler, null: false, foreign_key: true
      # t.references :sefile, null: true, foreign_key: true
      t.integer :position
      t.integer :btncolor
      t.integer :volume
      t.boolean :loopable

      t.timestamps
    end
  end
end
