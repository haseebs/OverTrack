class AddGroupSizeToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :group_size, :integer, default: 1
  end
end
