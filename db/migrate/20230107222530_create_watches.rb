class CreateWatches < ActiveRecord::Migration[6.0]
  def change
    create_table :watches do |t|
      t.string :body
      t.string :status, :default => "to watch"
      t.integer :user_id

      t.timestamps
    end
  end
end
