class IronReview::Scraper

BASE_URL = "https://www.beautybrands.com/hair-bath-skincare-makeup/reviews-tools-curling+irons.do"

  def self.scrape_irons
    doc = Nokogiri::HTML(open(BASE_URL))
    doc.css(".grid").each do |iron_doc|
      #binding.pry
      #name = iron_doc.css(".grid a").attribute("title").text
      #url = iron_doc.css(".grid a").attribute("href").text

    end
  end
end
