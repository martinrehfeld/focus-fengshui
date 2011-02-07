require 'nanoc3/tasks'

namespace :deploy do
  desc "Sync compiled /output to S3"
  task :s3 do
    if Nanoc3::Site.new('.').nil?
      $stderr.puts 'The current working directory does not seem to be a ' +
                   'valid/complete nanoc site directory; aborting.'
      exit 1
    end

    sh 's3cmd --verbose --force --progress --no-encrypt sync output/ s3://focus-fengshui.de'
  end
end
