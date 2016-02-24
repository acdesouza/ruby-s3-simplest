require 'aws-sdk'

class UploaderS3

  def initialize(access_key_id, secret_access_key, bucket_name)
    Aws.config.update({
      region: 'sa-east-1',
      credentials: Aws::Credentials.new(access_key_id, secret_access_key)
    })
    @s3 = Aws::S3::Resource.new

    @bucket = @s3.bucket(bucket_name)
  end

  def upload(filename, filepath)
    object = @bucket.object("ac_mpb/#{Time.now}-#{filename}") # Do not replace existing files.
    object.put(body: File.open(filepath))
  end
end
