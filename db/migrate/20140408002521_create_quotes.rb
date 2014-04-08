class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.belongs_to :feeling, index: true
      t.text :body

      t.timestamps
    end
  end
end
