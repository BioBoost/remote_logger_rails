class ChangeClientDescriptionToText < ActiveRecord::Migration[5.1]
  def change
    change_column :clients, :description, :text
  end
end
