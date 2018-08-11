class IronReview::Iron
  attr_accessor :name, :url, :benefit, :description

@@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
end
