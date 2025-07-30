#1

Course.create(coding_class_id: "1", trimester_id: "8", max_enrollment: "25")
Course.create(coding_class_id: "2", trimester_id: "8", max_enrollment: "25")
Course.create(coding_class_id: "3", trimester_id: "8", max_enrollment: "25")
Course.create(coding_class_id: "4", trimester_id: "8", max_enrollment: "25")
Course.create(coding_class_id: "5", trimester_id: "8", max_enrollment: "25")

#2

Student.create(first_name: "Val", last_name: "Lyzhyn", email: "val@test.com")
student_id = Student.last.id
Enrollment.create(course_id: "1", student_id: student_id)
enrollment_id = Enrollment.last.id
mentor_id = MentorEnrollmentAssignment.group(:mentor_id).having("COUNT(enrollment_id) < 3").pluck(:mentor_id).first
MentorEnrollmentAssignment.create(mentor_id: mentor_id, enrollment_id: enrollment_id)

#3

Food ordering app

Who are the users of your application?
Registered users
Restaurant admins

Do you have different types of users or different roles?

users can place the orders and admins can manage their restaurants

What are the core user scenarios or features of your app? These could be statements like...

Authentication,Browse restaurants, View menus, Place an order

#4

1. Users
id
username
email
password
2. Restaurants
id
name
address
3. MenuItems
id
name
price
restaurant_id
4. Orders
id
user_id 
restaurant_id
status 
5. OrderItems
id
order_id
menu_item_id
quantity

One user can have multiple orders
Restaurant has many MenuItems 
One order has multiple OrderItems