# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Category.create(name:"Leer",past:"leyó",sustantivo:"Libros")
Category.destroy_all
User.destroy_all
Activity.destroy_all

Category.create(name:"Leer",past:"leyó",sustantivo:"Libros",participio:"leído")
Category.create(name:"Ver Películas",past:"vió",sustantivo:"Películas",participio:"vista")

User.create(name:"Ganso",email:"ganso@ganso.ganso",password:'123456')
User.create(name:"Gato",email:"gato@gato.gato",password:'123456')
User.create(name:"Oso",email:"oso@oso.oso",password:'123456')

@user_id = User.last.id
@category_id = Category.last.id

Activity.create(name:'The Princess Diaries',owner_id:@user_id,category_id:@category_id,remote_photo_url:'https://upload.wikimedia.org/wikipedia/en/thumb/5/58/Princess_diaries_ver1.jpg/220px-Princess_diaries_ver1.jpg')
Activity.create(name:'Matrix',owner_id:@user_id,category_id:@category_id,remote_photo_url:'https://upload.wikimedia.org/wikipedia/en/thumb/c/c1/The_Matrix_Poster.jpg/220px-The_Matrix_Poster.jpg')