require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name 
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{ |s| s.name}
  end
  
  def self.new_from_filename(mp3file)
    song = self.new 
    song.name = mp3file.split(/[-.]/)[1].strip
    song.artist_name = mp3file.split(/[-.]/)[0].strip
    song
  end
  
  def self.create_from_filename(mp3file)
    song = self.new 
    song.name = mp3file.split(/[-.]/)[1].strip
    song.artist_name = mp3file.split(/[-.]/)[0].strip
    @@all << song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
