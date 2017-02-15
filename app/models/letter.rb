class Letter < ApplicationRecord
  extend FriendlyId
  friendly_id :pretty_url, use: [:slugged, :finders]

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

  def recipients_pp
    if self.recipients.count
      return self.recipients.map { |r| "<strong>#{r.name}</strong>, #{r.description}" }.to_sentence
    else
      return ""
    end
  end

  def recipients_admin_pp
    if self.recipients.count
      return self.recipients.map { |r| r.name }.to_sentence
    else
      return ""
    end
  end

  def authors_pp
    if self.authors.count
      return self.authors.map { |a| a.name }.to_sentence
    else
      return ""
    end
  end

  def authors_admin_pp
    if self.authors.count
      return self.authors.map { |a| a.name }.to_sentence
    else
      return ""
    end
  end

  def pretty_url
    if self.published && self.authors.length > 0 && self.recipients.length > 0
      [ self.published.year, self.published.month.to_s.rjust(2, '0'), self.published.day.to_s.rjust(2, '0'), self.authors.first.first_name[0], self.authors.first.last_name, "to", self.recipients.first.first_name, self.recipients.first.last_name ].join("-")
    else
      self.id
    end
  end
end
