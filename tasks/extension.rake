require File.expand_path(File.dirname(__FILE__) + '/util')

EXTENSION_DIR = File.expand_path(ENV['EXTENSION_DIR'] || "#{WORKSPACE_DIR}/browser_extension")

desc 'Export existing build to unpack extension dir'
task 'export_extension' do
  rm_rf EXTENSION_DIR
  mkdir_p File.dirname(EXTENSION_DIR)
  cp_r "#{WORKSPACE_DIR}/src/main/webapp", EXTENSION_DIR
  IO.write("#{EXTENSION_DIR}/manifest.json",IO.read("#{EXTENSION_DIR}/manifest.json").gsub('"version": "1.0"',"\"version\": \"#{Buildr.projects[0].version}\""))
end


desc 'Build extension and copy result to unpack extension dir'
task 'unpack_extension' do
  puts "Unpacking browser extension to #{EXTENSION_DIR}"

  task('package').invoke
  task('export_extension').invoke
end
