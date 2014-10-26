module TimeagoHelper
  def timeago(timestamp, options = {})
    options[:class] ||= "timeago"
    options[:class] += " timeago" unless options[:class].match(/timeago/)

    content_tag(:abbr, l(timestamp),
                options.merge(title: timestamp.getutc.iso8601)) if timestamp
  end
end
