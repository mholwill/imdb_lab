require('pry-byebug')

require_relative( 'models/movie')
require_relative( 'models/star')
require_relative( 'models/casting')

  movie1 = Movie.new({
    'title' => 'Bad Boys',
    'genre' => 'Family'
  })
  movie1.save()

  movie2 = Movie.new({
    'title' => 'Con Air',
    'genre' => 'Educational'
  })
  movie2.save()

  movie3 = Movie.new({
    'title' => 'Commando',
    'genre' => 'Family'
  })
  movie3.save()

  star1 = Star.new ({
    'first_name' => 'Arnie',
    'last_name' => 'Swaz'
  })
  star1.save()

  star2 = Star.new ({
    'first_name' => 'Nicky',
    'last_name' => 'Cee'
  })
  star2.save()

  star3 = Star.new ({
    'first_name' => 'Big',
    'last_name' => 'Willy'
  })
  star3.save()

  casting1 = Casting.new({
    'star_id' => star1.id,
    'movie_id' => movie3.id,
    'fee' => 1000
  })
  casting1.save()

  casting2 = Casting.new({
    'star_id' => star3.id,
    'movie_id' => movie1.id,
    'fee' => 1200
  })
  casting2.save()

  casting3 = Casting.new({
    'star_id' => star2.id,
      'movie_id' => movie2.id,
      'fee' => 10
  })
  casting3.save()

  casting4 = Casting.new({
    'star_id' => star1.id,
    'movie_id' => movie2.id,
    'fee' => 200
  })
  casting4.save()

  binding.pry
  nil
