class AddProvideravatarToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provideravatar, :string
  end
end
