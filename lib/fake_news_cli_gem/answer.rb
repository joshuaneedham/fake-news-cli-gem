class FakeNewsCliGem::Answer
  attr_accessor :id, :title, :author, :entry_date, :text, :more_link

  # Class variable that stores all scraped data objects
  @@all = []
  # Initializes the answer object
  def initialize(title, id, entry_date, text, more_link)
    @id = id
    @title = title
    @author = author
    @entry_date = entry_date
    @text = text
    @more_link = more_link
    @@all << self
  end

  def self.all
    @@all
  end
end
