module DepartmentsHelper
  def departments_tree_for(departments = @departments)
    res = departments.map do |department, nested_departments|
      render(department) + nested_part(department, nested_departments)
    end

    res.join.html_safe
  end

  private

  def nested_part(department, nested_departments)
    if nested_departments.size > 0
      content_tag(:div, class: 'nested') do
        departments_tree_for(nested_departments)
      end
    else
      nil
    end
  end
end
