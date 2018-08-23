class AddUserReferenceToWorkExamples < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_examples, :user, foreign_key: true
  end
end
