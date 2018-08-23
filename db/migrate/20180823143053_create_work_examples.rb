class CreateWorkExamples < ActiveRecord::Migration[5.2]
  def change
    create_table :work_examples do |t|
      t.string :title
      t.text :description
      t.string :ThumbImage
      t.string :MainImage

      t.timestamps
    end
  end
end
