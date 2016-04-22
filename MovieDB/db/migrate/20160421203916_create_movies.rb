class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :picture
      t.string :description
      t.string :title
      t.string :friendly_url
      t.timestamps
    end
  end
end
