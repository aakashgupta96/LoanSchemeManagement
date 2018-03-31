module ApplicationHelper

	def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "#", class: "remove_fields",)
  end
  
  def link_to_add_fields(name, f, association)
  	new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("/shared/"+ association.to_s.singularize + "_fields", :f => builder)
    end
    id = fields.gsub("\n","").split("id=\"").second.split("\"").first
    link_to(name, "#", class: "add_fields", data: {id: id, fields: fields.gsub("\n","")})
  end

  def status_message(status)
    if status == "new_ticket"
      "New Ticket"
    elsif status == "open"
      "Opened"
    elsif status == "resolved"
      "Resolved"
    elsif status == "escalated"
      "Escalated to Officer"
    else
      "Unknown"
    end
  end

end
