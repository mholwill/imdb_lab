require_relative('../db/sql_runner')

class Casting



  attr_reader :id, :movie_id, :star_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee'].to_i()
  end

  def save
    sql = "INSERT INTO castings
    (
      movie_id,
      star_id,
      fee
    )
    VALUES
    (
      $1, $2, $3
    ) RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values).first()
    @id = casting['id'].to_i
  end


  def update()
    sql = "UPDATE castings
    SET
    fee = $1
    WHERE id = $2"
    values = [@fee, @id]
    SqlRunner.run(sql, values)
  end

  def star()
    sql = "SELECT * FROM stars
    WHERE id = $1"
    values = [@star_id]
    star = SqlRunner.run(sql, values).first
    return Star.new(star)
  end


  def movie()
    sql = "SELECT * FROM movies
    WHERE id = $1"
    values = [@movie_id]
    movie = SqlRunner.run(sql, values).first
    return Movie.new(movie)
  end


  def self.map_items(casting_data)
    result = casting_data.map { |casting| Casting.new(casting) }
    return result
  end

  def self.all()
    sql = "SELECT * FROM castings"
    castings = SqlRunner.run(sql)
    return Star.map_items(castings)
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end




end
