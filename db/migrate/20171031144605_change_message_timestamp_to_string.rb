class ChangeMessageTimestampToString < ActiveRecord::Migration[5.1]
  def change
    change_column :messages, :logtime, :string
  end
end
