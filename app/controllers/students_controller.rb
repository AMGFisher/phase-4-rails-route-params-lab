class StudentsController < ApplicationController

  def index
    students = Student.all
    
    if params[:name]

      search_name = params[:name].downcase
      students = students.filter do |student|
        student.first_name.downcase == search_name|| student.last_name.downcase == search_name
      end
    end

    render json: students
  end

  def show
   render json: Student.find(params[:id])
  end

end
