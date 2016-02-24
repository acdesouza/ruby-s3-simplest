class SimplestRubyS3
  def call(env)
    request = Rack::Request.new(env)

    case request.request_method
    when 'GET'
      if env["PATH_INFO"] == '/'
        return [
          200,
          {
            'Content-Type'  => 'text/html',
            'Cache-Control' => 'public, max-age=86400'
          },
          File.open('public/index.html', File::RDONLY)
        ]
      end
    when 'POST'
      if env["PATH_INFO"] == "/upload"

        uploader_s3 = UploaderS3.new(ENV['ACCESS_KEY_ID'],
                                     ENV['SECRET_ACCESS_KEY'],
                                     ENV['BUCKET_NAME'])
        uploader_s3.upload(request.params["file"][:filename],
                           request.params["file"][:tempfile])

        return [200, {'Content-Type'  => 'text/html'}, ["Uploaded: #{request.params}"]]
      end
    end

    [404, {}, ["Did you get lost?"]]
  end
end
