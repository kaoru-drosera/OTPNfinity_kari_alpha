class ReversFoeignKey < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :sefiles, :seboards 
  end
end
