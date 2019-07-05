# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_webdev = Category.create(name: 'Web Development')
category_java = Category.create(name: 'Java')
category_full_stack_dev = Category.create(name: 'Full Stack Dev')
category_ios_engineering = Category.create(name: 'iOS Engineering')

location_14_10_31 = Location.create(name: '14.10.31')
location_14_08_26 = Location.create(name: '14.08.26')
location_14_10_30 = Location.create(name: '14.10.30')

coordinator_andy_song = Coordinator.create(name: 'Andy Song', image: 'coordinator-1.jpg', email: 'andy.song@rmit.edu.au', password: 'RM1t@1234')
coordinator_ali_yavari = Coordinator.create(name: 'Ali Yavari', image: 'coordinator-1.jpg', email: 'ali.yavari@rmit.edu.au', password: 'RM1t@1234')
coordinator_alex_jiang = Coordinator.create(name: 'Alex Jiang', image: 'coordinator-2.jpg', email: 'alex.jiang@rmit.edu.au', password: 'RM1t@1234')

Course.create(name: 'Rapid Application Development', prerequisite: 'Web Programming', description: 'Rapid Application Development.', categories: [category_webdev], locations: [location_14_10_31, location_14_08_26], coordinator: coordinator_andy_song)
Course.create(name: 'Capstone Project', prerequisite: 'Advanced Programming', description: 'Capstone Project. Capstone Project.', categories: [category_full_stack_dev], locations: [location_14_10_31], coordinator: coordinator_ali_yavari)
Course.create(name: 'Advanced iOS/OSX Programming', prerequisite: '3 years iOS or relevant experience', description: 'Advanced iOS/OSX Programming..', categories: [category_ios_engineering], locations: [location_14_10_30], coordinator: coordinator_alex_jiang)
