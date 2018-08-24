class CreateWorkexamples < ActiveRecord::Migration[5.2]
  def change
    create_table :workexamples do |t|
      t.string :title
      t.text :description
      t.string :thumbimage
      t.string :mainimage
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
