# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'unpacker'

task :default => :test

desc 'Test the unpacker gem.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Performs code coverage on the unpacker gem.'
Rcov::RcovTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

PROJ.name = 'unpacker'
PROJ.authors = 'Petyo Ivanov'
PROJ.email = 'underlog@gmail.com'
PROJ.url = 'http://github.com/underlog/unpacker'
PROJ.version = Unpacker::VERSION
PROJ.rubyforge.name = 'unpacker'

PROJ.spec.opts << '--color'

# EOF
