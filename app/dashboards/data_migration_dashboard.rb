require "administrate/base_dashboard"

class DataMigrationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    completed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    new_gsuite_password: Field::String,
    routed_to_o365: Field::Boolean,
    in_progress: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :completed,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :completed,
    :new_gsuite_password,
    :in_progress,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :completed,
    :new_gsuite_password,
    :in_progress,
  ].freeze

  # Overwrite this method to customize how data migrations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(data_migration)
  #   "DataMigration ##{data_migration.id}"
  # end
end
