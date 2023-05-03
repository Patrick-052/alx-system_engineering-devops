#!/usr/bin/env ruby
#print a regular expression that matches a string
#+that begins with h and ends with n that can contain
#+any single character in btn

puts ARGV[0].scan(/^h.n$/).join
