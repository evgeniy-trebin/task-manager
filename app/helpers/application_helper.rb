module ApplicationHelper

  def attr_name(model_class, attr)
    model_class.human_attribute_name(attr)
  end

  def button_new(url, model_class=nil)
    link_button [t('views.buttons_text.new'), model_class].join(' '), url
  end

  def button_show(url)
    link_button t('views.buttons_text.show'), url, css_class: 'btn-success'
  end

  def button_edit(url, model_class=nil)
    link_button [t('views.buttons_text.edit'), model_class].join(' '), url, css_class: 'btn-success'
  end

  def button_back(url)
    link_button t('views.buttons_text.back'), url
  end

  def link_button(text, url='#', css_class: 'btn-default')
    link_to text, url, class: %{btn #{css_class}}
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
