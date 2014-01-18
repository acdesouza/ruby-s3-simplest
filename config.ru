#\ -w
require './app/s3_uploader.rb'

use Rack::Reloader

run S3Uploader.new
