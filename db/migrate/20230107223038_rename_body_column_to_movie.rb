class RenameBodyColumnToMovie < ActiveRecord::Migration[6.0]
  def change
    rename_column :watch, :body, :movie
  end
end
