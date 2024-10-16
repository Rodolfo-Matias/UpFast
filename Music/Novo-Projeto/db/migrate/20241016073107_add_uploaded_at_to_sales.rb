class AddUploadedAtToSales < ActiveRecord::Migration[7.2]
  def change
    add_column :sales, :uploaded_at, :datetime
  end
end
