class ChangeColumnToAllowNull < ActiveRecord::Migration[6.1]
  def up
    change_column :seboards, :sefile_id,:bigint, null: true
  end

  def down
    change_column :seboards, :sefile_id,:bigint, null: false
  end
end
