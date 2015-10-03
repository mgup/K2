# Регистрируемый документ (приказ).
class Office::Order < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :document_type, class_name: 'Office::DocumentType'

  validates :number, :suffix, office_order_number: true
  validates :suffix, inclusion: { in: [nil, ''] + ('а'..'я').to_a }

  has_attached_file :document, preserve_files: true
  validates_attachment_content_type :document, content_type: 'application/pdf'

  default_scope do
    order('extract(year from date) DESC')
      .order(number: :desc)
      .order(suffix: :desc)
  end

  scope :with_document_type, -> (id) { where(document_type_id: id) }

  searchable do
    time :date
    text :number do
      full_number
    end
    text :title

    integer :year do
      date.year
    end
    string :number
    string :suffix
  end

  def date
    super || Date.today
  end

  def number
    super || ((document_type.orders.maximum(:number) || 0) + 1)
  end

  def full_number
    "#{document_type.prefix}/#{number}#{suffix}"
  end
end
