class BooksController < ApplicationController
  before_action :authenticate_admin!

  def index
    # print("Current : " + current_admin.email)
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
    @students = Student.all
    #@books = Book.all
  end

  def new
    @book = Book.new
    @authors = Author.all
    @genres = Genre.all
    @students = Student.all
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end


  def edit
    @book = Book.find(params[:id])
    @authors = Author.all
    @genres = Genre.all
    @students = Student.all
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  
    redirect_to books_path, notice: 'successfully deleted.'
  end
  

  def show
    @book = Book.find(params[:id])
    lend
  end

  def lend
    @book = Book.find(params[:id])
    # print("before")
    @students = Student.all
    # print("After")
  end

  def create_lending
    @book = Book.find(params[:id])
    @student_ids = params[:book][:student_ids]

    students = Student.where(id: @student_ids)
    @book.students << students
  
    @book.save
  
  end

  def create_lending
    @book = Book.find(params[:id])
    @student_ids = params[:book][:student_ids]

    students = Student.where(id: @student_ids)

    students.each do |student|
      unless @book.students.include?(student)
        if @book.rent < @book.quantity
          @book.students << student
          @book.increment!(:rent)
        else
          flash[:alert] = "No Copy available"
          return redirect_to @book
        end
      else
        flash[:alert] = "Book is already assigned to this student"
        # print("yesssss")
      end
    end

    @book.save
    redirect_to @book
  end

  

  def return_book
    @book = Book.find(params[:id])
    student_id = params[:student_id]

    @book.students.delete(Student.find(student_id))
    @book.decrement!(:rent)

    redirect_to @book
  end
  
  

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :quantity, :added_by, :genre , :rent, author_ids: [], genre_ids: [])
  end
end
