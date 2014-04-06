class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string :feeling
      t.string :adjective
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
