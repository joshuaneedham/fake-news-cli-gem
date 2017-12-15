# Fake News CLI Gem

We are building a cli gem that will scrape FactCheck.org/fake-new.

Steps to complete

Done - 1. Setup gem with initial files to get started including dependencies
Done - 2. Create initial results_page scraper including using Nokogiri to map out the elements we want to display in our list of available articles.
Done - 3. Create article scraper and use Nokogiri to map out the full_content piece that will be displayed upon selection from out initial list page.
4. Create CLI with a workflow that provides a good user experience
5. Demo the CLI


<!--
title = answer_links.css(".entry-title").text
date = answer_links.css(".entry-date").text.strip
text = answer_links.css(".text").text.gsub(/Click here to read more/,'').strip
answer_link = answer_links.css(".more-link").attribute("href").value
:id, :title, :author, :publish_date, :text, :more_link, :sources
 -->


