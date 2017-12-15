class FakeNewsCliGem::Scraper

  def initialize(url = "http://factcheck.org/fake-news/")
    @url = url
  end

  # Scrapes the search results of the /fake-news url
  def search_results
    @doc = Nokogiri::HTML(open(@url))
    fact_links = @doc.css(".post")
    id = 0

    fact_links.collect.with_index(1) do |answer, index|
      a = FakeNewsCliGem::Answer.new(answer.css(".entry-title").text)
      a.id = index
      a.title = answer.css(".entry-title").text.strip
      a.entry_date = answer.css(".entry-date").text.strip
      a.text = answer.css(".text").text.gsub(/Click here to read more/,'').strip
      a.more_link = answer.css(".more-link").attribute("href").value
      a
    end
  end

  # Gives us a title from the search page
  def get_page_title
    page_title = @doc.css(".content-part #page-title h2 span").text.strip
  end
  #
  # Gives us a short description from the search page
  def get_site_description
    site_description = @doc.css(".content-part #page-title .category-description").text.strip
  end

  # Provides the answer/article linked via a search page result
  def answers(answer_id)
    answer = ""

    FakeNewsCliGem::Answer.all.find {|a| answer = a if a.id == answer_id}

    answer_page = Nokogiri::HTML(open(answer.more_link))
    puts "\n#{title = answer_page.css(".entry-title").text}"
    puts "\n#{author = answer_page.css(".entry-author").text.gsub(/By/, '').strip}"
    puts "\n#{publish_date = answer_page.css(".entry-date").text.gsub(/Posted on/, '').strip}"
    body = answer_page.css(".text p").collect do |p|
      p.text
    end[0..-4].each { |p| puts "\n#{p}" }
    puts ""
  end

end
