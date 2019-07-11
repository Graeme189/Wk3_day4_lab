require_relative('../models/movie')
require_relative('../models/casting')
require_relative('../models/star')

require('pry-byebug')

movie1 = Movie.new({'title' => 'Star Wars', 'genre' => 'Sci fi'})
movie2 = Movie.new({'title' => 'Death of Stalin', 'genre' => 'Comedy'})
movie3 = Movie.new({'title' => 'Indiana Jones', 'genre' => 'action'})
