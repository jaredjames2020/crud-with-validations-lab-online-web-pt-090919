class Song < ApplicationRecord

       validates :title, presence: true
       validates :title, uniqueness: {scope: :release_year}
       validates :artist_name, presence: true

       validate :datemarked
       validate :causality

       def datemarked
           if released
               errors.add(:release_year, "must be recorded") if !release_year
           end
       end

       def causality
           if release_year and release_year > Date.today.year
               errors.add(:release_year, "cannot be in the future")
           end
       end

end
