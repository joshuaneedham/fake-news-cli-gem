class FakeNewsCliGem::CLI

  def initialize
    @fake_news_articles = FakeNewsCliGem::Scraper.new
    @answers = @fake_news_articles.search_results
  end

  def call
    intro
    choice = ""
    until choice == "n" || choice == "exit" do
        puts "\nType #{"list".bold} if you wish to see the list again or #{"exit".red} to exit the program."
        puts "Would you like to read more about a particular article listed? #{"(y/n)".bold}"
        choice = gets.strip.downcase
        if choice == "y"
          input = ""
          until [(1..10).map(&:to_s), "exit"].flatten.include? input do
              puts "Please enter and ID number #{"between 1 and 10".bold} or #{"exit".red} to exit the program."
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
        # Returns Title and short description from the source
        def cli_source_info
          puts "\n ***** #{@fake_news_articles.get_page_title} ***** ".blue.bold
          puts "\n #{@fake_news_articles.get_site_description}"
        end

        def welcome_message
          puts "Welcome to the FactChecker Fake News Scraper"
          puts "\nBelow you will find several links factcheck.org \"fake news\" articles."
        end

        def intro
          cli_source_info
          welcome_message
        end

        # Returns list of articles from the search page
        def list_all(answer_id)
          href = ""
          @fake_news_articles.find {|a| href = a.more_link if a.id == answer_id}
          system("open #{href}")
        end

        # Returns the full answer/article from the user selection
        def info(answer_id)
          @fake_news_articles.answers(answer_id)
          input = ""
          until ["y", "n"].include? input do
              puts "Would you like to read the full article? #{"(y/n)".bold}"
              input = gets.strip.downcase
              list_all(answer_id) if input == "y"
            end
          end

          def footer
            puts "\n- Come Back Soon -"
            puts "source: www.factcheck.org".light_black
            puts "- Goodbye -"
            puts ""
          end


        end
