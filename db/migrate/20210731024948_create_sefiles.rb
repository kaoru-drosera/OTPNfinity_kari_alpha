class CreateSefiles < ActiveRecord::Migration[6.1]
  def change
    create_table :sefiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :sename
      t.binary :sedata

      t.timestamps
    end
  end
end
