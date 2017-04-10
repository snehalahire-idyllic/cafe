class AddMenuToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :menu, foreign_key: true
  end
end
