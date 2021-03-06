# Направление (специальность).
class Direction < ActiveRecord::Base
  has_paper_trail

  belongs_to :direction_category
  belongs_to :department

  has_many :education_documents
  has_many :plans, class_name: 'Study::Plan'

  validates :direction_category_id, presence: true

  default_scope do
    where('code IS NOT NULL AND code != ?', '').order(:name)
  end

  scope :with_old, lambda {
    unscoped.order(:name, :code, :old_code)
  }

  scope :accredited, -> { where('department_id IS NOT NULL') }

  def full_code
    if code.present?
      if code.include?('.02.')
        "#{code} (.#{old_qualification})"
      else
        code
      end
    else
      "#{old_code}.#{old_qualification}"
    end
  end

  def full_name
    "#{full_code} #{name}"
  end
end
