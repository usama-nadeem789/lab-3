class CreateBooksStudentsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :books, :students do |t|
      t.index [:book_id, :student_id]
      t.index [:student_id, :book_id]
    end
  end
end
