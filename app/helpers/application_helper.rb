module ApplicationHelper
  def bootstrap_alert_class(type)
    case type.to_sym
    when :notice
      'alert-info'
    when :success
      'alert-success'
    when :error, :alert
      'alert-danger'
    else
      'alert-primary'
    end
  end
end
