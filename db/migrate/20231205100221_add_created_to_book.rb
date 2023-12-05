class AddCreatedToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :added_by, :string
  end
end

