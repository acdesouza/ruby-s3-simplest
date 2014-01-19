#\ -w
require 'rubygems'
require 'bundler/setup'

require './app/simplest_ruby_s3'

use Rack::Reloader

run SimplestRubyS3.new
