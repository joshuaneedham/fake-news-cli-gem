class FakeNewsCliGem::Answer
  attr_accessor :id, :title, :author, :entry_date, :text, :more_link
  # Class variable that stores all scraped data objects
  @@all = []
  # Initializes the answer object
  def initialize(title)
    @title = title
    @@all << self
  end

  def self.all
    @@all
  end
end
