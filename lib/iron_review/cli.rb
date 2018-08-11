class IronReview::CLI
  def start
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
    puts "Select an iron for the product description:"
    puts ""
    input = gets.strip
    index = input.to_i - 1
    iron = IronReview::Iron.all[index]
      if !iron.description || !iron.benefit
    IronReview::Scraper.scrape_details(iron)
    end
    puts ""
    puts "Here are the product details:"
    puts ""
    puts iron.description
    puts ""
    puts iron.benefit
    puts ""
    list_irons
    select_irons
  end
end
