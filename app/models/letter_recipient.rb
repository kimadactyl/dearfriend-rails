class LetterRecipient < ApplicationRecord
  belongs_to :recipient
  belongs_to :letter
end
