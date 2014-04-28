class ChangeStringToText < ActiveRecord::Migration
  def change
  	change_column :moods, :adjective, :text
  end
end
