class AddPhonenumberToUser < ActiveRecord::Migration
  def change
  	add_column :moods, :phonenumber, :string
  end
end
