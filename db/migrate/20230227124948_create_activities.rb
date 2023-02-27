class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :location
      t.string :poster_url

      t.timestamps
    end
  end
end
