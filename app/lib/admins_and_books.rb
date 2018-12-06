class AdminsAndBooks

  ADMINS = %w[
    Aaron
    Alex
    Chops
    Chris
    COD
    Danny
    Greg
    Leland
    Michael
    Spagnola
    Nick
    Scott
  ]

  CURRENT_PICKER_INDEX = 6

  SEASON_FOUR_ORDER = %w[
    Aaron
    Danny
    COD
    Scott
    Nick
    Chris
    Michael
    Spagnola
    Leland
    Chops
    Greg
    Alex
  ]

  BOOKS = {
    season_1: [
      "Cat's Cradle",
      "I Invented The Modern Age",
      "Under The Skin",
      "How Music Works",
      "Dream Team",
      "Unbroken",
      "Do Androids Dream of Electric Sheep",
      "Women",
      "Inherent Vice",
      "Good Omens",
      "Waking Up",
      "The art of racing in the rain",
    ],
    season_2: [
      "Watchmen",
      "Predictably Irrational",
      "The Wright Brothers",
      "Ancillary Justice",
      "All The Pretty Horses",
      "Lafayette in the Somewhat United States",
      "The Boys in the Boat",
      "One Flew Over the Cuckoo's Nest",
      "Redeployment",
    ],
    season_3: [
      "A Constellation of Vital Phenomena",
      "Dune",
      "The River Why",
      "The Glass Cage",
      "Between the World and Me",
      "In Patagonia",
      "Hillbilly Elegy",
      "The Control Of Nature",
      "Killers of the Flower Moon",
      "Fantasy Land",
      "A Knight of the Seven Kingdoms",
    ]
  }

  def self.current_picker
    SEASON_FOUR_ORDER[CURRENT_PICKER_INDEX]
  end

  def self.up_next
    SEASON_FOUR_ORDER[CURRENT_PICKER_INDEX + 1]
  end

  def self.already_picked
    order = []

    SEASON_FOUR_ORDER.each_with_index do |name, index|
      order << name if index < CURRENT_PICKER_INDEX
    end.compact

    order
  end

  def self.left_to_pick
    order = []

    SEASON_FOUR_ORDER.each_with_index do |name, index|
      order << name if index > CURRENT_PICKER_INDEX
    end.compact

    order
  end

  def self.seed(persist: false)
    all_books = Book.all
    seasons = BOOKS.keys

    seasons.each do |season|
      BOOKS[season].each do |title|
        season_number = season.to_s.last.to_i
        existing_book = all_books.find_by(title: title)

        if persist
          if existing_book.present?
            existing_book.update!(season: season_number)
          else
            Book.create(title: title, season: season_number)
          end
        else
          print [season_number, title]
        end
      end
    end
  end

end
