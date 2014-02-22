#!/usr/bin/env ruby
#
# corporation.rb
# SWN Corporation Generator
#
# Copyright (c) 2014 Steve Simenic <orffen@orffenspace.com>
#
# This file is part of the SWN Toolbox.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

require './unindent'
require 'yaml'

# This class generates an corporation from tables/corporation.yaml,
# which has the following attributes:
#
# - name (string)
# - business (string)
# - reputation (string)
#
class Corporation
  attr_reader :name, :business, :reputation

  def initialize
    yaml = YAML.load(File.read('tables/corporation.yaml'))
    @name       = "#{yaml['name'].sample} #{yaml['organization'].sample}"
    @business   = yaml['business'].sample.to_str
    @reputation = yaml['reputation'].sample.to_str
  end

  def to_s
    <<-EOS.unindent
      |Name: #{@name}
      |Business: #{@business}
      |Reputation: #{@reputation}
      EOS
  end
end


if __FILE__ == $0
  Integer(ARGV.shift || 1).times do |e|
    puts '-----------+-+-+-----------' unless e.zero?
    puts Corporation.new
  end
end
