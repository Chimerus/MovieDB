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
  {title:"Iron Man", picture:"http://www.dvdactive.com/images/news/screenshot/2008/8/ironman1discr1artpic1.jpg", description:"After being held captive in an Afghan cave, a billionaire engineer creates a unique weaponized suit of armor to fight evil.", friendly_url:"iron_man"},
  {title:"Mad Max: Fury Road", picture:"http://cdn1-www.superherohype.com/assets/uploads/gallery/mad-max-fury-road_1/mad-max-fury-road-poster2.jpg", description:"A woman rebels against a tyrannical ruler in postapocalyptic Australia in search for her home-land with the help of a group of female prisoners, a psychotic worshipper, and a drifter named Max.", friendly_url:"mad_max_fury_road"},
  {title:"Star Wars: Episode VII - The Force Awakens", picture:"http://d.fastcompany.net/multisite_files/fastcompany/imagecache/inline-large/inline/2015/10/3052458-inline-i-1-celebrate-the-poster.jpg", description:"Three decades after the defeat of the Galactic Empire, a new threat arises. The First Order attempts to rule the galaxy and only a ragtag group of heroes can stop them, along with the help of the Resistance.", friendly_url:"star_wars_episode_vii_the_force-awakens"}
  ])  

# to add more users
# {username: "", password: "",  email: "",  picture: "", is_admin: false },
User.create([
  {username: "Phil", password: "password", email: "a@gmail.com", picture: "", is_admin: false },
  {username: "John", password: "password", email: "test@gmail.com", picture: "", is_admin: false },
  {username: "Sir Robert Testingson the Third Esqire", password: "password", email: "pippipcheeriohuzzzah@veryverylongname.com", picture: "http://www.nndb.com/people/496/000098202/sir-john-tenniel-1-sized.jpg", is_admin: false },
  {username: "Adminy", password: "passwordy", email: "test@test.com", picture: "http://www.returnofkings.com/wp-content/uploads/2014/03/ban.jpg", is_admin: true }
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