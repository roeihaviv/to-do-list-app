class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :movie
      t.string :status, :default => "not yet watched"

      t.timestamps
    end
  end
end
