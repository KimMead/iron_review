class IronReview::CLI
  def start
    puts ""
    puts "Welcome to your curling iron list!"
    puts ""

  IronReview::Scraper.scrape_irons
  list_irons
  end

  def list_irons
    puts "Here is the list of the best reviewed curling irons."
    puts ""
    irons = IronReview::Iron.all
    irons.each.with_index(1).each do |iron, index|
    puts "#{index}. #{iron.name}"
    end
    select_irons
  end

  def select_irons
    puts ""
    puts "Select an iron for the product details or type 'exit':"
    puts ""
    input = gets.strip
    if input != "exit"
      # if the input the user put in is between 1 and 20 or how many objects we have
        # we will display an error messae
        # we will then list out all of the irons again
      if !input.to_i.between?(1, IronReview::Iron.all.count)
        puts "That is not a valid entry.  Please try again."
        list_irons
      end
    index = input.to_i - 1
    iron = IronReview::Iron.all[index]
      if !iron.description || !iron.benefit
    IronReview::Scraper.scrape_details(iron)
    end
    puts ""
    puts "Here are the product details:"
    puts ""
    puts "PRODUCT DESCRIPTION:"
    puts iron.description
    puts ""
    puts "PRODUCT BENEFIT:"
    puts iron.benefit
    puts ""
    list_irons
    select_irons
  end
  end
end
