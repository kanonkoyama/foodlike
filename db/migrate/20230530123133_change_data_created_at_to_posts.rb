class ChangeDataCreatedAtToPosts < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :created_at, :date
  end
end
