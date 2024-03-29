require_relative('../db/sql_runner')

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  def save()
    sql = "INSERT INTO movies (title, genre)
          VALUES ($1, $2)
          RETURNING id;"
   values = [@title, @genre]
   movie = SqlRunner.run(sql, values).first
   @id = movie['id'].to_i
 end

 def update()
   sql = "UPDATE movies SET title = $1
         WHERE id = $2;"
    values = [@title, @id]
    SqlRunner.run(sql, values)
 end

 def self.all()
  sql = "SELECT * FROM movies"
  movies = SqlRunner.run(sql)
  return movies.map { |movie| Movie.new( movie ) }
end

  def self.delete_all
   sql = "DELETE FROM movies"
   SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
