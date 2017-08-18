class AddPhoneAndIsConfirmedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :is_confirmed, :boolean, default: false
  end
end
