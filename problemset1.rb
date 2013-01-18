#!/c/Ruby193/bin/ruby 
require_relative 'dna'

my_sequence = DNA.new(ARGV.first)

puts my_sequence.pretty_base_count
