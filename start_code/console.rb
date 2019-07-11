require_relative('models/movie')
require_relative('models/casting')
require_relative('models/star')

require('pry-byebug')

movie1 = Movie.new({'title' => 'Star Wars', 'genre' => 'Sci fi'})
movie1.save

movie1.title = 'Star Wars Episode 4'
movie1.update()

movie2 = Movie.new({'title' => 'Death of Stalin', 'genre' => 'Comedy'})
movie2.save()

movie3 = Movie.new({'title' => 'Indiana Jones', 'genre' => 'action'})
movie3.save()

movie3.title = 'Raiders of the Lost Ark'
movie3.update()

star1 = Star.new({'first_name' => 'Harrison', 'last_name' => 'Ford'})
star1.save

star2 = Star.new({'first_name' => 'Mark', 'last_name' => 'Hamill'})
star2.save

star3 = Star.new({'first_name' => 'Steve', 'last_name' => 'Buscemi'})
star3.save

star1.first_name = 'George'
star1.last_name = 'Clooney'
star1.update()


binding.pry
nil
