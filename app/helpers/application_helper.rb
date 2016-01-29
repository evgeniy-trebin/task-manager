module ApplicationHelper

  def attr_name(model_class, attr)
    model_class.human_attribute_name(attr)
  end

end
