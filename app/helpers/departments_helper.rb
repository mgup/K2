# Хэлперы для упрощения вывода списка подразделений.
module DepartmentsHelper
  def departments_tree_for(departments = @departments)
    res = departments.map do |department, nested_departments|
      render(department) + nested_part(nested_departments)
    end

    res.join.html_safe
  end

  private

  def nested_part(departments)
    if departments.size > 0
      content_tag(:div, class: 'nested') do
        departments_tree_for(departments)
      end
    end
  end
end
