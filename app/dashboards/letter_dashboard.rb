require "administrate/base_dashboard"

class LetterDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    authors: Field::HasMany,
    authors_pp: Field::String,
    recipients: Field::HasMany,
    recipients_admin_pp: Field::String,
    id: Field::Number,
    recieved: Field::DateTime,
    published: Field::DateTime,
    is_draft: Field::Boolean,
    content: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    scans: CarrierwaveManyField,
    preview: CarrierwaveField,
    slug: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :authors_pp,
    :recipients_admin_pp,
    :recieved,
    :published
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :authors,
    :recipients,
    :recieved,
    :published,
    :is_draft,
    :content,
    :scans,
    :preview,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :authors,
    :recipients,
    :recieved,
    :published,
    :is_draft,
    :content,
    :scans,
    :preview,
    :slug,
  ].freeze

  # Overwrite this method to customize how letters are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(letter)
    if letter.authors.present? && letter.recipients.present?
      "From #{letter.authors.first.name} to #{letter.recipients.first.name}"
    else
      "Letter #{letter.id}"
    end
  end
end
