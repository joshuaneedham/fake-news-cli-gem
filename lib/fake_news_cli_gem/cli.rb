class FakeNewsCliGem::CLI

  def initialize
    @fake_news_articles = FakeNewsCliGem::Scraper.new
    @questions = @fake_news_articles.search_results
  end

  def call
    # Calls the 'intro' method below
    intro
    # Variable is user input on the initial action to take after starting the gem
    choice = ""
    # Defines the options the user can take and the result is 'var = choice'
    until choice == "n" || choice == "exit" do
      # Questions output on screen asking user what they want to do
      puts "\nType #{"list".bold} if you wish to see the list again or #{"exit".red} to exit the program."
      puts "Would you like to read more about a particular article listed? #{"(y/n)".bold}"
      # Gets user input for 'choice' variable
      choice = gets.strip.downcase
      if choice == "y"
        input = ""
        until [(1..10).map(&:to_s), "exit"].flatten.include? input do
          puts "Please enter an #{"article number".green} you would like to read, or #{"exit".red} to exit the program."
        input = gets.strip.downcase
      end
      if (1..10).map(&:to_s).include? input
        info(input.to_i)
      elsif input == "exit"
        footer
        break
      end
      elsif choice == "n" || choice == "exit"
        footer
      elsif choice == "list"
        intro
      end
    end
  end


  ############## CLI METHODS ###############
  # Initial welcome message
  def welcome_message
    puts "Welcome to the FactChecker Fake News Scraper"
    puts "\nBelow you will find several factcheck.org \"fake news\" articles."
  end
  # Information about the source of the scraped data
  def cli_source_info
    puts "***** #{@fake_news_articles.get_page_title} ***** ".blue.bold
    puts "#{@fake_news_articles.get_site_description}"
  end
  # Initial scraped data produced by the scraper.rb 'search_results' method
  def initial_list
  # Using an instance variable indicated in the 'initialize' function above this displays a teaser list of items scraped.
    @questions.each do |a|
      puts "#{"Article: #{a.id} - Date: #{a.entry_date}".italic}".colorize(:color => :green)
      puts "#{a.title}\n".colorize(:blue).underline
      puts "#{a.text}".colorize(:color => :black, :background => :white)
      puts ""
    end
  end
  # Methods being run at the beginning of the gem startup
  def intro
    welcome_message
    cli_source_info
    initial_list
  end

  # Returns list of articles from the search page
  def list_all(answer_id)
    href = ""
    @questions.find {|a| href = a.more_link if a.id == answer_id}
    system("open #{href}")
  end

  # Returns the full answer/article from the user selection
  def info(answer_id)
    @fake_news_articles.answers(answer_id)
    input = ""
    until ["y", "n"].include? input do
      puts "Would you like to read the full article on FactCheck.org? #{"(y/n)".bold}"
      input = gets.strip.downcase
      list_all(answer_id) if input == "y"
    end
  end
  # Provides a short message upon exiting the CLI gem.
  def footer
    puts "\n- Thanks for checking the facts with us... -"
    puts "source: www.factcheck.org".light_black
    puts "- Feel free to check back again in the future for more articles. -"
    puts ""
  end
end
