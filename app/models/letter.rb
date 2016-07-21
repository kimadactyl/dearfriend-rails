class Letter < ApplicationRecord
  has_many :letter_authors
  has_many :authors, through: :letter_authors
  has_many :letter_recipients
  has_many :recipients, through: :letter_recipients

  accepts_nested_attributes_for :letter_recipients, :recipients, :letter_authors, :authors

  mount_uploaders :scans, ScansUploader
  mount_uploader :preview, PreviewUploader
end
