class AddPublishedAtToComments < ActiveRecord::Migration
  def change
    add_column :comments, :published_at, :datetime
  end
end
