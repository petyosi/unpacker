$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'unpacker'
require 'spec'
require 'ruby-debug'
require 'spec/autorun'

Dir[ File.join(File.dirname(__FILE__), 'matchers/*') ].each do |matcher|
  require matcher
end

Spec::Runner.configure do |config|

end

