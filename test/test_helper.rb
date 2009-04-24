$: << File.join(File.dirname(__FILE__), '..', 'lib')
$: << File.join(File.dirname(__FILE__))

require 'rubygems'
require 'test/unit'
require 'unpacker'

class Test::Unit::TestCase

  def fixture_archive(file)
    File.join("test", "fixtures", file)
  end

end
