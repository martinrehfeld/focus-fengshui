require 'nanoc3/tasks'

namespace :deploy do
  desc "Sync compiled /output to S3"
  task :s3 do
    `s3cmd --verbose --force --progress --no-encrypt sync output/ s3://focus-fengshui.de`
  end
end
