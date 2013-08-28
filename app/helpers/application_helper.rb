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
end
