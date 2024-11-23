class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :title, null: false
      t.text :main_text, null:false
      t.references :novel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
