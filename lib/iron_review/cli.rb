class CLI
  def start
    puts "Welcome to your curling iron review!"
    puts ""
    puts "Here is the list of the reviewed curling irons."

Scraper.scrape_irons
    #display list of curling irons
  end
end
