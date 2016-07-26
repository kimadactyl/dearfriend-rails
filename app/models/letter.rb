class Letter < ApplicationRecord
  has_many :letter_authors
  has_many :authors, through: :letter_authors
  has_many :letter_recipients
  has_many :recipients, through: :letter_recipients

  accepts_nested_attributes_for :letter_authors
  accepts_nested_attributes_for :letter_recipients
  accepts_nested_attributes_for :authors, :recipients

  mount_uploaders :scans, ScansUploader
  mount_uploader :preview, PreviewUploader

  def recieved_pp
    self.recieved.strftime(DATE_ONLY)
  end

  def published_pp
    self.published.strftime(DATE_ONLY)
  end
end
