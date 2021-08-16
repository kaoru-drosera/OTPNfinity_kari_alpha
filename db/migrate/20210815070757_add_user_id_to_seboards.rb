class AddUserIdToSeboards < ActiveRecord::Migration[6.1]
  def change
    add_column :seboards, :user_id, :bigint, index: true
  end
end
