class S3Uploader
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
        return [200, {'Content-Type'  => 'text/html'}, ["Uploaded"]]
      end
    end

    [404, {}, ["Did you get lost?"]]
  end
end
