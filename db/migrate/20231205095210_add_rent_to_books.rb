class AddRentToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :rent, :integer
  end
end
