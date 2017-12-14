class FakeNewsCliGem::Answer
  attr_accessor :id, :title, :author, :publish_date, :text, :more_link, :sources

  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end
