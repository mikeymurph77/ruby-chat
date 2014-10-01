class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false, default: ""
      t.string :link, null: false, default: ""
      t.date :date, null: false
      t.belongs_to :user, null: false

      t.timestamps null: false
    end
  end
end
