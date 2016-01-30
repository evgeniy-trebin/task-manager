module ApplicationHelper

  def attr_name(model_class, attr)
    model_class.human_attribute_name(attr)
  end

  def flash_messages
    TaskManagerSettings::FLASHES.inject('') do |html, (key, value)|
      html += alert(key, value)
    end.html_safe
  end

  def alert(key, css_class)
    return '' if flash[key.to_sym].blank?
    content_tag(:div, class: "alert alert-#{css_class} alert-dismissible") do
      alert_close_button + flash[key.to_sym]
    end
  end

  def alert_close_button
    render partial: '_common/alert_close_button'
  end

end
