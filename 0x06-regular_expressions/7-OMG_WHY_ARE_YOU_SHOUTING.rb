#!/usr/bin/env ruby
#prints a regex that only match capital letters

puts ARGV[0].scan(/[A-Z]/).join
