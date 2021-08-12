class CreateSefiles < ActiveRecord::Migration[6.1]
  def change
    create_table :sefiles do |t|
      t.references :user, null: false, foreign_key: true
      # t.references :seboard, null: true, foreign_key: true
      t.string :sename
      t.string :sedata

      t.timestamps
    end
  end
end
