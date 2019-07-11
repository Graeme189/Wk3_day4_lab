require_relative('../db/sql_runner')
require_relative('./movie')
require_relative('./star')

class Casting

attr_accessor :movie_id, :star_id, :fee
attr_reader :id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @movie_id = options['movie_id'].to_i
  @star_id = options['star_id'].to_i
  @fee = fee
end

def save()
  sql = "INSERT INTO castings (movie_id, star_id, fee)
        VALUES ($1, $2, $3)
        RETURNING id;"
 values = [@movie_id, @star_id, @fee]
 casting = SqlRunner.run(sql, values).first
 @id = casting['id'].to_i
end

def movies
  sql = "SELECT * FROM movies
  WHERE id = $1;"
  values = [@movie_id]
  movie = SqlRunner.run(sql, values).first
  return Movie.new(movie)
end

def star
  sql = "SELECT * FROM stars
  WHERE id = $1;"
  values = [@star_id]
  star = SqlRunner.run(sql, values).first
  return Star.new(star)
end

end

# def location
#     sql = "SELECT * FROM locations WHERE id = $1;"
#     values = [@location_id]
#     location = SqlRunner.run(sql, values).first
#     return Location.new(location)
#   end
  #
  # def user
  #   sql = "SELECT * FROM users WHERE id = $1;"
  #   values = [@user_id]
  #   user = SqlRunner.run(sql, values).first
  #   return User.new(user)
  # end
  #
  # def save()
  #   sql = "INSERT INTO visits
  #   (
  #     user_id,
  #     location_id,
  #     review
  #   )
  #   VALUES
  #   (
  #     $1, $2, $3
  #   )
  #   RETURNING id"
  #   values = [@user_id, @location_id, @review]
  #   visit = SqlRunner.run( sql,values ).first
  #   @id = visit['id'].to_i
  # end
  #
  # def self.all()
  #   sql = "SELECT * FROM visits"
  #   visits = SqlRunner.run(sql)
  #   result = visits.map { |visit| Visit.new( visit ) }
  #   return result
  # end
  #
  # def self.delete_all()
  #   sql = "DELETE FROM visits"
  #   SqlRunner.run(sql)
  # end
