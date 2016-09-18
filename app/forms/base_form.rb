class BaseForm

  include ActiveModel::Model

  def delegate_attributes_to_form(model, attributes)
    model = instance_variable_get("@#{model}")

    attributes.each do |attr|
      instance_variable_set("@#{attr}", model.send(attr))
    end
  end

end
