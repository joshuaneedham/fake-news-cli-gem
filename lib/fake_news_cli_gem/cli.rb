class FakeNewsCliGem::CLI

  def call
    puts "Welcome to the FactChecker Fake News Scraper"
    FakeNewsCliGem::Scraper.new
    binding.pry
  end

end
