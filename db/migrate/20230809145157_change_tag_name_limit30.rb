class ChangeTagNameLimit30 < ActiveRecord::Migration[7.0]
  def up
    change_column :tags, :name, :string, limit: 30
  end

  def down
    change_column :tags, :name, :string, limit: 15
  end
end
