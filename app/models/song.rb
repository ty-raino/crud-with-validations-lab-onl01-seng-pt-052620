class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {
        scope: %i[release_year artist_name],
        message: 'cannot repeat name of song by the same artist, in the same year'
    }
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: :released? 
    
    def released?
        released
    end
end
