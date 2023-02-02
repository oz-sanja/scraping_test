require 'date'
require 'httparty'

url = "https://www.nasa.gov/api/2/ubernode/479003"

response = HTTParty.get(url)

{
  title: response.dig("_source","title"),
  date: DateTime.iso8601(response.dig("_source","promo-date-time")).strftime('%F'),
  release_no: response.dig("_source","release-id"),
  article: response.dig("_source","body").split("</div>\n\n").last
}