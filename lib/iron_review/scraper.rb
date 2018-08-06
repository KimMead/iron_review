class IronReview::Scraper

BASE_URL = "https://www.beautybrands.com/hair-bath-skincare-makeup/reviews-tools-curling+irons.do"

  def self.scrape_irons
    doc = Nokogiri::HTML(open(BASE_URL))
    doc.css('.detailImageWrapper').each do |iron_doc|
      name = item
    #binding.pry
    end
  end
end
