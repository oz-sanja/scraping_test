require 'date'
require 'pdf-reader'

path = '/path/to/PDFs/'

files = Dir.glob("#{path}*")

array = []

files.each do |file|
  reader = PDF::Reader.new(file)
  page = reader.pages.first
  part_of_page = page.text&.gsub("\n", ' ')&.gsub(/[()_]/, '')&.gsub(/ +/, ' ')

  if part_of_page.index('Judgment for Cost').nil? && part_of_page.index('Appointed Attorney').nil?
    next
  end

  date = part_of_page.split('Date of').last.split(':')[1].split(" ").first
  date = date.split('/')

  date[2] = "20#{date[2]}" if date[2].length == 2

  q = part_of_page.split(',')[0].split(' ')
  index_of = q.index('Alaska').to_i + 1

  array << {
    petitioner: q[index_of.to_i..-1].join(' '),
    state: "State of #{ part_of_page.split('State of').last.split(' ').first.gsub(/ ,/, '')}",
    amount: "$#{part_of_page.split('$').last.split(' ').first.split(',').join(',')}",
    date: DateTime.new(date[2].to_i, date[0].to_i, date[1].to_i).strftime('%F')
  }
end

array



