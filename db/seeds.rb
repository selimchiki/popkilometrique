# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'selimchiki@yahoo.fr', password: 'azerty', password_confirmation: 'azerty', active: true)
Scale.create!(vehicle_type: 0, coefficient: 0.41 , fiscal_power: '3CV et moins', active: true)
Scale.create!(vehicle_type: 0, coefficient: 0.493, fiscal_power: '4CV', active: true)
Scale.create!(vehicle_type: 0, coefficient: 0.543, fiscal_power: '5CV', active: true)
Scale.create!(vehicle_type: 0, coefficient: 0.568, fiscal_power: '6CV', active: true)
Scale.create!(vehicle_type: 0, coefficient: 0.595, fiscal_power: '7CV et +', active: true)
Scale.create!(vehicle_type: 1, coefficient: 0.338, fiscal_power: '1 ou 2CV', active: true)
Scale.create!(vehicle_type: 1, coefficient: 0.4, fiscal_power: '3, 4 ou 5CV', active: true)
Scale.create!(vehicle_type: 1, coefficient: 0.518, fiscal_power: '+ de 5CV', active: true)
Scale.create!(vehicle_type: 2, coefficient: 0.269, fiscal_power: 'Tout Modèle', active: true)
