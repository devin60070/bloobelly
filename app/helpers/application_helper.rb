module ApplicationHelper
    # Used for dynamically adding field sets to the page.
    # name          Displayed name for add fields link
    # f             Form f variable
    # association   form association to display
    #
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, '#{association}', '#{escape_javascript((fields))}')"))
  end
end
