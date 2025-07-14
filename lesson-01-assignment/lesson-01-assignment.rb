#1

coding_class = CodingClass.find_by({ title: 'Intro to Programming' })
enrollments = Enrollment.where(course_id: coding_class.id)
students_ids = enrollments.where(course_id: coding_class.id).pluck(:student_id)
students = Student.where(id: students_ids)
students.limit(2).each do |st|
  puts "<#{st.id}>, <#{st.email}>"
end

#2

coding_class = CodingClass.find_by({ title: 'Intro to Programming' })
enrollments_ids = Enrollment.where(course_id: coding_class.id).pluck(:id)
m_enrollments = MentorEnrollmentAssignment.where(enrollment_id: enrollments_ids)
not_completed_ids = Enrollment.where(course_id: coding_class.id).where.not(final_grade: "completed").or(Enrollment.where(course_id: coding_class.id , final_grade: nil)).pluck(:id)
mentor_ids = m_enrollments.where(id: not_completed_ids).pluck(:mentor_id)
mentors = Mentor.where(id: mentor_ids)
mentors.limit(2).each do |mentor|
  puts "<#{mentor.id}>, <#{mentor.email}>"
end
