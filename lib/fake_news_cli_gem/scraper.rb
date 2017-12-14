class FakeNewsCliGem::Scraper

  def initialize(url = "http://factcheck.org/fake-news/")
    @url = url
  end

  # Scrapes the search results of the /fake-news url
  def search_results
    @doc = Nokogiri::HTML(open(@url))
    fact_links = @doc.css(".post")


    #title = answer_links.css(".entry-title").text
    #date = answer_links.css(".entry-date").text.strip
    #text = answer_links.css(".text").text.gsub(/Click here to read more/,'').strip
    #answer_link = answer_links.css(".more-link").attribute("href").value
    #:id, :title, :author, :publish_date, :text, :more_link, :sources
    binding.pry
  end
end
