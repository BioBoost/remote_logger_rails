class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :auth_key
      t.string :description

      t.timestamps
    end
  end
end
