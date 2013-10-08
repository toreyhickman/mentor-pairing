module ApplicationHelper
  def display_availability(a)
    localtime(a, :start_time).strftime("%m/%d/%Y") +
    " from " + localtime(a, :start_time).strftime("%I:%M%P") +
    " to " + localtime(a, :end_time).strftime("%I:%M%P ") + a.timezone +
    " at " + (a.location.blank? ? "Dev Bootcamp" : a.location)
  end

  def localtime(a, attribute)
    a[attribute].in_time_zone(a.timezone)
  end

  def display_appointment(a)
    link_to_user(a.mentor) + " is mentoring " +
    link_to_user(a.mentee) + " on " +
    display_availability(a)
  end

  def link_to_user(m)
    link_to(m.name + " - #{m.total_kudos}", "https://twitter.com/" + m.twitter_handle)
  end
end
