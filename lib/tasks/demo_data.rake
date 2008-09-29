desc "Import demo contacts data from a given source file"
task :demo_data => :environment do
  file_names = ARGV[1..-1]
  if file_names.empty?
    puts "Usage: rake demo_data file_name"
    puts "File paths must be relative to RAILS_ROOT"
    exit 0
  end
  
  file_names.each do |file_name|
    open(File.join(RAILS_ROOT, file_name)) do |file|
      while line = file.gets do
        Contact.connection.execute line 
      end
    end
    
    puts "Imported data from #{file_name}"
  end
end