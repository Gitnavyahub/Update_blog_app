class AddDefaultToFirstNameInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :first_name, "Navya"
    change_column_default :users, :last_name, "Bajpai"
  end
end
