class AddStatusToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :status, :string
  end
end
