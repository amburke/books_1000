class Book < ActiveRecord::Base

  def self.season(number: 0)
    Book.where(season: number)
  end

  def self.each_season
    Book.all.map(&:season).uniq
  end

  def author_with_fallback
    return author if author.present?

    fetch_book_details.authors.first
  end

  def description
    fetch_book_details.description
  end

  def small_image
    fetch_book_details.image_urls["smallThumbnail"]
  end

  def big_image
    fetch_book_details.image_urls["thumbnail"]
  end

  private def fetch_book_details
    bookfinder_client.books(title).first
  end

  private def bookfinder_client
    @bookfinder_client ||= BookFinder::Client.new
  end

end
