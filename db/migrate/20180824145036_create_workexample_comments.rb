class CreateWorkexampleComments < ActiveRecord::Migration[5.2]
  def change
    create_table :workexample_comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :workexample, foreign_key: true

      t.timestamps
    end
  end
end
