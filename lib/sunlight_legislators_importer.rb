require 'csv'
require 'byebug'

require_relative '../app/models/congressman'
filename ='db/data/legislators.csv'

# module CongressmanImporter
#   def self.import(filename=File.dirname(__FILE__) + "/../db/data/legislators.csv")
#     field_names = nil
#     Congressman.transaction do
#       File.open(filename).each do |line|
#         data = line.chomp.split(',')
#         if field_names.nil?
#           field_names = data
#         else
#           attribute_hash = Hash[field_names.zip(data)]
#           congressman = Congressman.create!(attribute_hash)
#         end
#       end
#     end
#   end

# end


class SunlightLegislatorsImporter
  def self.import(filename)
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      hash = {}
      # byebug
      row.each do |field, value|
        # TODO: begin
        hash[field] = value
        # TODO: end
      end
      Congressman.create(hash)
    end
  end
end

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
