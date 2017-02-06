require "administrate/base_dashboard"

class RecipientDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    letter_recipients: Field::HasMany,
    letters: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    description: Field::String,
    born: Field::DateTime,
    website: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    died: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :letter_recipients,
    :letters,
    :id,
    :first_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :letter_recipients,
    :letters,
    :id,
    :first_name,
    :last_name,
    :description,
    :born,
    :website,
    :created_at,
    :updated_at,
    :died,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :letter_recipients,
    :letters,
    :first_name,
    :last_name,
    :description,
    :born,
    :website,
    :died,
  ].freeze

  # Overwrite this method to customize how recipients are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(recipient)
    recipient.last_first
  end
end
