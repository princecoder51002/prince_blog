class Article < ApplicationRecord

    validates :title, presence: true, length: {minimum: 6, maximum: 100}
    validates :description, presence: true, length: {minimum: 10, maximum: 500} # this ensures the presence of title of any article to be saved

end