# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require 'faker'

User.create(email: "member@this.application.it", password: "password", role: "member")
User.create(email: "super_admin@this.application.it", password: "password", role: "super_admin")

HashMap.create(user_id: User.first.id, name: "First Map", data:  '{"key1": "value1", "key2": "value2"}')
