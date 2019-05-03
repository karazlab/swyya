module ApplicationHelper
  def check_alert(key)
    case key
    when 'notice' then 'primary'
    when 'alert' then 'danger'
    else
      key
    end
  end

  def time_ago(time)
    " #{time_ago_in_words(time)} ago"
  end

  def user_information(object)
    object.user_username || object.user_email
  end

  def object_liked?(object)
    return false unless user_signed_in?
    current_user.voted_for?(object) && object.get_upvotes.where(voter: current_user).present?
  end
end
