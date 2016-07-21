class LetterAuthor < ApplicationRecord
  belongs_to :author
  belongs_to :letter
end
