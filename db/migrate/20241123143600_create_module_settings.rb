class CreateModuleSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :module_settings do |t|
      t.string :name
      t.boolean :disabled

      t.timestamps
    end
  end
end
