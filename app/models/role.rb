# Роль назначения.
class Role < ActiveRecord::Base
  # rubocop:disable Rails/HasAndBelongsToMany
  has_and_belongs_to_many :positions,
                          class_name: 'Hr::Position',
                          join_table: :positions_roles
  # rubocop:enable Rails/HasAndBelongsToMany

  belongs_to :resource, polymorphic: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end
