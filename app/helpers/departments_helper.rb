# Хэлперы для упрощения вывода списка подразделений.
module DepartmentsHelper
  def departments_tree_for(departments = @departments)
    res = departments.map do |department|
      render(department) + nested_part(department.children)
    end

    res.join.html_safe
  end

  private

  def nested_part(departments)
    return if departments.size.zero?

    content_tag(:div, class: 'nested') do
      departments_tree_for(departments)
    end
  end
end
