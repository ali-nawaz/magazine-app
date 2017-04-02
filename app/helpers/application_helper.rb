module ApplicationHelper
  def format_full_date(ar_obj)
    ar_obj.created_at.strftime('%B %-d, %Y at %l:%M %P %Z')
  end
end
