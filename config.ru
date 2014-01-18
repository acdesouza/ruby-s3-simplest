#\ -w
require './app/simplest_ruby_s3.rb'

use Rack::Reloader

run SimplestRubyS3.new
