class CreateSamplers < ActiveRecord::Migration[6.1]
  def change
    create_table :samplers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :sampler_name

      t.timestamps
    end
  end
end
