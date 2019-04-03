require "test_adventure/version"

module TestAdventure
  class Error < StandardError; end
  # Your code goes here...

  def load_dependencies
    rbfiles = File.join('../lib',"**", "*.rb")
    Dir.glob(rbfiles).each do |file|
      require_relative file
      puts "loaded #{file}"
    end
  end

  def load_files(dir)
    puts "Searching tests in #{dir}"
    rbfiles = File.join(dir,"**", "*.rb")
    file_count = 0
    Dir.glob(rbfiles).each do |file|
      file_count+=1
      test = generate_test(file, file_count)
      test.instance_eval(File.read(file))
      puts Renderer.get_renderer('textile').render(test)
    end
    puts "#{file_count} files found"
  end

  def generate_test(file, count)
    name = File.basename(file, '.rb').capitalize
    test = Test.new(name, "T#{count}")
  end
end