class Book < ActiveRecord::Base

  def self.season(number: 0)
    Book.where(season: number)
  end
end
