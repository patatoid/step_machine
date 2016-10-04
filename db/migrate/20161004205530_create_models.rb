class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :models do |t|
      5.times do |i|
        5.times do |j|
          t.string "field_#{i}_#{j}"
        end
      end
      t.string :current_step
      t.timestamps
    end
  end
end
