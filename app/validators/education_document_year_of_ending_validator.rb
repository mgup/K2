# Валидатор, проверяющий, что введён осмысленный год окончания образовательного
# учреждения.
class EducationDocumentYearOfEndingValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _)
    return if (1900..Time.zone.today.year).include?(record.year_of_ending)

    record.errors[attribute] << error_message
  end

  private

  def error_message
    options[:message] || '— неверный год окончания образовательного учреждения'
  end
end
