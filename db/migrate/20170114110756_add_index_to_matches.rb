class AddIndexToMatches < ActiveRecord::Migration[5.0]
  def change
    add_index :matches, [:user_id, :created_at],
                        order: { created_at: :desc }
  end
end
