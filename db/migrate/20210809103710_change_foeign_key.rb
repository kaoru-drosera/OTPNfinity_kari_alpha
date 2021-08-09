class ChangeFoeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :seboards, :sefiles
  end
end
