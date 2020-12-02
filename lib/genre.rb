class Genre

  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Genre.new(name)
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end

#rspec spec/006_artists_and_genres_spec.rb