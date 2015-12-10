# Функции для работы с вложенными формами (редактирование связанных моделей).
module NestedFormHelper
  def link_to_add_fields(name, f, association, options = {})
    options[:partial] ||= association.to_s.singularize + '_fields'

    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object,
                          child_index: "new_#{association}") do |builder|
      render(options[:partial], f: builder)
    end

    link_to name, "##{association}",
            onclick: "add_fields(this, '#{association}', "\
                     "'#{escape_javascript(fields)}')"
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) +
      link_to(name, '#', onclick: 'remove_fields(this)')
  end
end
