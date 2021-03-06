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
  {title:"Zootopia", picture:"http://www.moviemagik.in/files/posters/3558/zootopia.jpg", description:"In a city of anthropomorphic animals, a rookie bunny cop and a cynical con artist fox must work together to uncover a conspiracy.", friendly_url: "zootopia"},
  {title:"Iron Man", picture:"http://cdn.collider.com/wp-content/uploads/iron-man-poster.jpg", description:"After being held captive in an Afghan cave, a billionaire engineer creates a unique weaponized suit of armor to fight evil.", friendly_url:"iron_man"},
  {title:"Mad Max: Fury Road", picture:"http://cdn1-www.superherohype.com/assets/uploads/gallery/mad-max-fury-road_1/mad-max-fury-road-poster2.jpg", description:"A woman rebels against a tyrannical ruler in postapocalyptic Australia in search for her home-land with the help of a group of female prisoners, a psychotic worshipper, and a drifter named Max.", friendly_url:"mad_max_fury_road"},
  {title:"Indiana Jones and the Last Crusade", picture:"https://upload.wikimedia.org/wikipedia/en/f/fc/Indiana_Jones_and_the_Last_Crusade_A.jpg", description:"When Dr. Henry Jones Sr. suddenly goes missing while pursuing the Holy Grail, eminent archaeologist Indiana Jones must follow in his father's footsteps and stop the Nazis.", friendly_url:"indiana_jones_and_the_last_crusade"},
  {title:"Star Wars: Episode VII - The Force Awakens", picture:"http://d.fastcompany.net/multisite_files/fastcompany/imagecache/inline-large/inline/2015/10/3052458-inline-i-1-celebrate-the-poster.jpg", description:"Three decades after the defeat of the Galactic Empire, a new threat arises. The First Order attempts to rule the galaxy and only a ragtag group of heroes can stop them, along with the help of the Resistance.", friendly_url:"star_wars_episode_vii_the_force-awakens"},
  {title:"The Shawshank Redemption", picture:"https://loftcinema.com/files/2014/11/the-shawshank-redemption-movie-poster-1994-1020260139.jpg", description:"Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", friendly_url:"the_shawshank_redemption"},
  {title:"The Godfather", picture:"https://s-media-cache-ak0.pinimg.com/236x/7f/bf/39/7fbf396b1234209ed0c887b8b932476f.jpg", description:"Michael, the young and idealistic son of Vito Corleone, the head of the most powerful Mafia clan in New York, returns home as a war hero and is determined to live his own life. But tragic circumstances make him face the legacy of his family.", friendly_url:"the_godfather"},
  {title:"Batman: The Dark Knight", picture:"https://paulmmartinblog.files.wordpress.com/2011/07/the_dark_knight_poster.jpg", description:"When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice.", friendly_url:"batman_the_dark_knight"},
  {title:"Schindler's List", picture:"http://ia.media-imdb.com/images/M/MV5BMzMwMTM4MDU2N15BMl5BanBnXkFtZTgwMzQ0MjMxMDE@._V1_UY1200_CR73,0,630,1200_AL_.jpg", description:"In Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.", friendly_url:"schindlers_list"},
  ])  

# to add more users
# {username: "", password: "",  email: "",  picture: "", is_admin: false },
User.create([
  {username: "Phil", password: "password", email: "a@gmail.com", picture: "", is_admin: false },
  {username: "John", password: "password", email: "test@gmail.com", picture: "", is_admin: false },
  {username: "Sir Robert Testingson the Third Esqire", password: "password", email: "pippipcheeriohuzzzah@veryverylongname.com", picture: "http://www.nndb.com/people/496/000098202/sir-john-tenniel-1-sized.jpg", is_admin: false },
  {username: "Adminy", password: "passwordy", email: "test@test.com", picture: "http://www.returnofkings.com/wp-content/uploads/2014/03/ban.jpg", is_admin: true },
  {username: "Test", password: "test",  email: "1@1.com",  picture: "", is_admin: false }
  ])

# to add more reviews
# {score: , comment: "", user_id: , movie_id:},
Review.create([
  {score: 5, comment: "Awesome!", user_id: 1, movie_id: 5},
  {score: 5, comment: "WITNESS ME!", user_id: 1, movie_id: 3},
  {score: 4, comment: "This review belongs in a museum!", user_id: 2, movie_id: 4},
  {score: 5, comment: "Sweet!", user_id: 2, movie_id: 3},
  {score: 1, comment: "Sucked!", user_id: 1, movie_id: 2},
  {score: 3, comment: "Derivative", user_id: 4, movie_id: 5},
  {score: 3, comment: "Adequate!", user_id: 3, movie_id: 2},
  {score: 5, comment: "Cool!", user_id: 4, movie_id: 4},
  {score: 4, comment: "Good!", user_id: 4, movie_id: 2},
  {score: 5, comment: "Truly, a cinematic masterpiece!", user_id: 3, movie_id: 4},
  {score: 5, comment: "IMDB can't be wrong!", user_id: 1, movie_id: 6},
  {score: 5, comment: "Inspiring!", user_id: 2 , movie_id: 6},
  {score: 5, comment: "Made me want to go to prison!", user_id: 4, movie_id: 6},
  {score: 5, comment: "This is an automated test", user_id: 5, movie_id: 6}
  ])