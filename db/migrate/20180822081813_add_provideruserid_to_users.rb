class AddProvideruseridToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provideruserid, :string
  end
end
