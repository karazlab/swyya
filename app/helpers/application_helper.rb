module ApplicationHelper
  def check_alert(key)
    case key
    when 'notice' then 'info'
    when 'alert' then 'danger'
    else
      key
    end
  end

  def time_ago(time)
    " #{time_ago_in_words(time)} ago"
  end
end
