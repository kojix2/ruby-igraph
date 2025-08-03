Dir.chdir(__dir__)
header_files = Dir.glob("../igraph/include/*.h")
header_files.each do |header_file|
  system("c2ffi #{header_file} > #{File.basename(header_file, '.h')}.json")
end
