class CreateBuyShips < ActiveRecord::Migration[6.0]
  def change
    create_table :buy_ships do |t|

      t.timestamps
    end
  end
end
