#1
What tables do you need to add? Decide on table names and their associations to each other and any existing tables/models.
I need to add topics table and since its a many to many relation with lessons i need to add a connecting table lesson_topics
#2    
What columns are necessary for the associations you decided on?
topics gonna have an id and topic_title. lesson_topics gonna have lesson_id and topic_id
#3
What other columns (if any) need to be included on the tables? What other data needs to be stored?
I dont have any ideas of any columns should be added for now 
#4
Write out each tables name and column names with data types.
topics: id: integer, topic_title: string
lesson_topics: id:integer, lesson_id: integer, topic_id: integer

#5
Determine the generator command youll need to create the migration file and run the command to generate the empty migration file.
 Start with just the topics migration. (Hint: your filename should be create_topics)
bin/rails generate migration create_topics

#6
Inside the create_table block in the migration file, add the appropriate columns and datatypes.
class CreateTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :topics do |t|
      t.string :topic_title

      t.timestamps
    end
  end
end

#7
Run the migration with bin/rails db:migrate (in a terminal window, not a rails console). 
Watch the output and make sure it is successful before moving on. (You can check the database to see if your table exists.)
-

#8
Add the Topic model before moving on.

    has_many: lesson_topics
    has_many: lessons, throough: :lesson_topics 

#9  
Now determine the generator command you'll need to create the migration file for the join table. Don't forget that it should begin with create_ and be followed by the table name.
bin/rails generate migration create_lesson_topics lesson:references topic:references

#10
Inside the create_table block, add associations to topics and lessons with t.references :topic and t.references :lesson
 create_table :lesson_topics do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps

#11
Run the migration.
bin/rails db:migrate

#12
If the migration run was successful, create the model for your join table (be sure the name matches Rails conventions).
class LessonTopic < ApplicationRecord
  belongs_to :lesson
  belongs_to :topic
end

#13
Open the console and test your new models by creating the topics above and adding them to some lessons.
Topic.create(topic_title: "java")