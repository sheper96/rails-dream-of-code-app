class Api::V1::EnrollmentsController < ApplicationController

  def static 
    enrollments = {
      enrollments: [
        {
          id: 55,
          courseId: 32,
          studentId: 22,
          finalGrade: "Completed"
        },
        {
          id: 61,
          courseId: 30,
          studentId: 23,
          finalGrade: "Completed"
        }
      ]
    }
   render json: { enrollments: enrollments }, status: :ok

  end


  def index
    course = Course.find(params[:course_id])
    enrollments = course.enrollments.map do |enrollment|
      {
        id: enrollment.id,
        courseId: enrollment.course_id,
        studentId: enrollment.student.id,
        finalGrade: enrollment.final_grade
      }
    end

    render json: {enrollments: enrollments} , status: :ok
  end
end