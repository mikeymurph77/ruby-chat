class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description, null: false, default: ""
      t.string :link, null: false, default: ""

      t.timestamps null: false
    end
  end
end
