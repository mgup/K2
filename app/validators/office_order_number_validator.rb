# Валидатор, проверяющий, что в течение одного календарного года нет приказов,
# у которых бы совпадал номер и суффикс.
class OfficeOrderNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _)
    orders = Office::Order
             .where('extract(year from date) = ?', record.date.year)
             .where(number: record.number)
             .where(suffix: record.suffix.blank? ? nil : record.suffix)
             .where('id != ?', record.id)

    return if orders.empty?

    record.errors[attribute] << error_message
  end

  private

  def error_message
    options[:message] || '— указан уже использованный номер документа'
  end
end
