class Photos < ActiveRecord::Migration
  def change
    create_table(:photos) do |t|
      t.string :url
      t.boolean :vote
    end
  end
end
