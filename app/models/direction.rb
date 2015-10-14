# Направление (специальность).
class Direction < ActiveRecord::Base
  has_paper_trail

  belongs_to :direction_category

  has_many :education_documents

  default_scope do
    where('code IS NOT NULL AND code != ?', '').order(:name)
  end

  scope :with_old, lambda {
    unscoped.order(:name, :code, :old_code)
  }

  def full_name
    if code.present?
      "#{code} #{name}"
    else
      "#{old_code}.#{old_qualification} #{name}"
    end
  end

  def full_code
    if code.present?
      code
    else
      "#{old_code}.#{old_qualification}"
    end
  end
end
