class IronReview::Scraper

BASE_URL = "https://www.beautybrands.com/hair-bath-skincare-makeup/reviews-tools-curling+irons.do"

  def self.scrape_irons
    doc = Nokogiri::HTML(open(BASE_URL))
    doc.css(".grid li").each do |iron_doc|
    name = iron_doc.css(".itemName").text
    url = iron_doc.css(".detailImageWrapper").attribute("href").value
    IronReview::Iron.new(name, url)
    end
    binding.pry
  end

  def self.scrape_details(iron)
    doc = Nokogiri::HTML(open(BASE_URL))
    doc.css(".ml-product-desc-short").each do |details_doc|
  end
end
end
