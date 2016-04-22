# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# to add more movies
# {title:"", picture:"", description:"", friendly_url:""},
Movie.create([
  {title:"Zootopia", picture:"https://upload.wikimedia.org/wikipedia/en/d/d6/Zootopia_Soundtrack.jpg", description:"In a city of anthropomorphic animals, a rookie bunny cop and a cynical con artist fox must work together to uncover a conspiracy.", friendly_url: "zootopia"},
  {title:"Iron Man", picture:"http://covers.box.sk/newsimg/dvdmov/max1355375016-inlay-cover.jpg", description:"After being held captive in an Afghan cave, a billionaire engineer creates a unique weaponized suit of armor to fight evil.", friendly_url:"iron_man"},
  {title:"Star Wars: Episode VII - The Force Awakens", picture:"", description:"", friendly_url:"star_wars_episode_vii_the_force-awakens"}
  ])  

# to add more users
# {username: "", password: "", email: "", is_admin: false },
User.create([
  {username: "Phil", password: "password", email: "a@gmail.com", is_admin: false },
  {username: "John", password: "password", email: "test@gmail.com", is_admin: false },
  {username: "Sir Robert Testingson the Third Esqire", password: "password", email: "pippipcheeriohuzzzah@veryverylongname.com", is_admin: false },
  {username: "Adminy", password: "passwordy", email: "test@test.com", is_admin: true }
  ])

# to add more reviews
# {score: , comment: "", user_id: , movie_id:},
Review.create([
  {score: 5, comment: "Awesome!", user_id: 1, movie_id: 1},
  {score: 5, comment: "Some!", user_id: 1, movie_id: 3},
  {score: 4, comment: "Awe!", user_id: 2, movie_id: 1},
  {score: 5, comment: "Sweet!", user_id: 2, movie_id: 3},
  {score: 1, comment: "Sucked!", user_id: 1, movie_id: 2},
  {score: 3, comment: "Derivative", user_id: 4, movie_id: 3},
  {score: 3, comment: "Adequate!", user_id: 3, movie_id: 2},
  {score: 5, comment: "Cool!", user_id: 3, movie_id: 1},
  {score: 4, comment: "Good!", user_id: 4, movie_id: 1},
  ])