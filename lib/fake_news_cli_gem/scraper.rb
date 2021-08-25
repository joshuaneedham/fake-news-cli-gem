class FakeNewsCliGem::Scraper
  def initialize(url = 'http://factcheck.org/scicheck/')
    @url = url
  end

  # Scrapes the search results of the /fake-news url
  def search_results
    @doc = Nokogiri::HTML(URI.open(@url))
    fact_links = @doc.css('.post')

    fact_links.each_with_index do |answer, index|
      id = index + 1
      title = answer.css('.entry-title').text.strip
      entry_date = answer.css('.entry-date').text.strip
      text = answer.css('.text').text.gsub(/Click here to read more/, '').strip
      more_link = answer.css('.entry-title a').attribute('href').value

      FakeNewsCliGem::Answer.new(title, id, entry_date, text, more_link)
    end #-> [<object:e8484848 @title=>, <object>]
  end

  # Gives us a title from the search page
  def get_page_title
    page_title = @doc.css('.content-part #page-title h2 span').text.strip
  end

  #
  # Gives us a short description from the search page
  def get_site_description
    site_description = @doc.css('.content-part #page-title .category-description').text.strip
  end

  # Provides the answer/article linked via a search page result
  def answers(answer_id)
    answer = ''

    FakeNewsCliGem::Answer.all.find { |a| answer = a if a.id == answer_id }

    answer_page = Nokogiri::HTML(URI.open(answer.more_link))

    puts "\n#{title = answer_page.css('.entry-title').text}".colorize(color: :green).bold.underline
    puts "\nAuthor: #{author = answer_page.css('.entry-author').text.gsub(/By/, '').strip}".colorize(color: :red)
    puts "\nPublish Date: #{publish_date = answer_page.css('.entry-date').text.gsub(/Posted on/,
                                                                                    '').strip}".colorize(color: :light_yellow)
    body = answer_page.css('.text p').collect do |p|
      p.text
    end[0..-4].each { |p| puts "\n#{p}" }
    puts ''
  end
end
