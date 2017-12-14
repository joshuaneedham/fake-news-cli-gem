class FakeNewsCliGem::Scraper

  def initialize(url = "http://factcheck.org/fake-news/")
    @url = url
  end

  # Scrapes the search results of the /fake-news url
  def search_results
    @doc = Nokogiri::HTML(open(@url))
    fact_links = @doc.css(".post")
    id = 0

    fact_links.collect do |answer|
      id += 1
      a = FakeNewsCliGem::Answer.new(answer.css(".entry-title").text)
      a.id
      a.title = answer.css(".entry-title").text.strip
      a.entry_date = answer.css(".entry-date").text.strip
      a.text = answer.css(".text").text.gsub(/Click here to read more/,'').strip
      a.more_link = answer.css(".more-link").attribute("href").value
      a
    end
  end

  # Gives us a title and short description of the search page
  def get_page_title
    page_title = @doc.css(".content-part #page-title h2 span").text.strip
  end

  def get_site_description
    site_description = @doc.css(".content-part #page-title .category-description").text.strip
  end

  def answers(answer_id)
    # answer = ""

    # FakeNewsCliGem::answer.all.find {|a| answer = a if a.id == answer_id}
    href = "http://www.factcheck.org/2017/12/fake-report-voter-fraud-alabama/"
    answer_page = Nokogiri::HTML(open(href))

    puts "\n#{title = answer_page.css(".entry-title").text}.bold"
    puts "\n#{author = answer_page.css(".entry-author").text.gsub(/By/, '').strip}"
    puts "\n#{publish_date = answer_page.css(".entry-date").text.gsub(/Posted on/, '').strip}"
    puts "\n#{text = answer_page.css(".entry .text").text.gsub(/Share the Facts
2017-12-14 17:49:06 UTC


FactCheck.org



7
1
11
 FactCheck.org Rating:
False

“The FEC has announced that it may have to recommend invalidating more than 60K votes” in Alabama’s U.S. Senate race.



Various websites
–
reaganwasright.com



Wednesday, December 13, 2017
2017-12-13



Read More
info

/, '').strip}"
    puts ""
  end

end
