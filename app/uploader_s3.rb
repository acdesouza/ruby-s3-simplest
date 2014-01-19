require 'aws/s3'

class UploaderS3

  def initialize(access_key_id, secret_access_key, bucket_name)
    @s3 = AWS::S3.new(
      :access_key_id => access_key_id,
      :secret_access_key => secret_access_key)

    @bucket = @s3.buckets[bucket_name]
  end

  def upload(filename, filepath)
    object = @bucket.objects["#{Time.now}-#{filename}"] # Do not replace existing files.
    object.write(Pathname.new(filepath))
  end
end
