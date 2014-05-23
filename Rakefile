builder_name = 'poppen'
image_name = 'chef-solo'
tag = "#{builder_name}/#{image_name}"

desc "deploy"
task :deploy => :clean do |t|
  sh "bundle install --path .bundle"
  sh "bundle exec berks vendor chef-repo/cookbooks"
end

desc "clean"
task :clean do |t|
  FileUtils.rm_rf('chef-repo/cookbooks') if Dir.exists?('chef-repo/cookbooks')
  FileUtils.rm('Berksfile.lock') if File.exists?('Berksfile.lock')
end

desc "build"
task :build do |t|
  sh "docker build -t #{tag} ."
end

desc "run as standalone-mode"
task :run_standalone do |t|
  sh "docker run --rm -i -t #{tag} /bin/bash"
end
