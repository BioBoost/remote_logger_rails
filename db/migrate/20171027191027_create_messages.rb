class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :client_id
      t.text :content
      t.string :severity
      t.timestamp :logtime

      t.timestamps
    end
  end
end
