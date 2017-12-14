class FakeNewsCliGem::Answer
  attr_accessor :id, :title, :author, :entry_date, :text, :more_link, :sources

  @@all = []
  def initialize(title)
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end

end
