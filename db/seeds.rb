# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
3.times do
  my_category = Category.create(title: Faker::Book.genre)
  3.times do
    my_task = Task.new(title: Faker::Book.title,
                      deadline: Faker::Date.forward(days: 23),
                      image: Faker::Avatar.image)
    my_task.category = my_category
    my_task.save
  end
end

15.times do
  my_emails = Email.create(object: Faker::Book.title,
                          body: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true, random_sentences_to_add: 30),
                          )
end