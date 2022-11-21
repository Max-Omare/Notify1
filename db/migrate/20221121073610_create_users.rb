class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :school
      t.string :reg_number
      t.string :phone

      t.timestamps
    end
  end
end
