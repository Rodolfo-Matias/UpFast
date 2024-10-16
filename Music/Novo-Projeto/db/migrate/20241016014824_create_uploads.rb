class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.string :file_name
      t.datetime :uploaded_at

      t.timestamps
    end
  end
end
