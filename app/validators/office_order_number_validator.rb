# Валидатор, проверяющий, что в течение одного календарного года нет приказов,
# у которых бы совпадал номер и суффикс.
class OfficeOrderNumberValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _)
    return if similar_orders(record).empty?

    record.errors[attribute] << error_message
  end

  private

  def similar_orders(record)
    Office::Order
      .where('extract(year from date) = ?', record.date.year)
      .where(number: record.number)
      .where(suffix: record.suffix.blank? ? nil : record.suffix)
      .where('id != ?', record.id)
  end

  def error_message
    options[:message] || '— указан уже использованный номер документа'
  end
end
