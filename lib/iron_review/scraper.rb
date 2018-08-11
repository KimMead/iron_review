class IronReview::Scraper

BASE_URL = "https://www.beautybrands.com/hair-bath-skincare-makeup/reviews-tools-curling+irons.do"

  def self.scrape_irons
    doc = Nokogiri::HTML(open(BASE_URL))
    doc.css(".grid li").each do |iron_doc|
    name = iron_doc.css(".itemName").text
    url = iron_doc.css(".detailImageWrapper").attribute("href").value
    IronReview::Iron.new(name, url)
    end
end

  def self.scrape_details(iron)
    url = iron.url
    doc = Nokogiri::HTML(open(url))
    iron.description = doc.css('.ml-product-desc-short').text

    binding.pry
  end
end
