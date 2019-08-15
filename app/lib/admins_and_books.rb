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

end
