class Book < ActiveRecord::Base

  def self.season(number: 0)
    Book.where(season: number)
  end

  def author_with_fallback
    return author if author.present?

    fetch_book_details.authors.first
  end

  def description
    fetch_book_details.description
  end

  private def fetch_book_details
    bookfinder_client.books(title).first
  end

  private def bookfinder_client
    @bookfinder_client ||= BookFinder::Client.new
  end

end
