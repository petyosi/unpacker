require 'fileutils'
require 'tmpdir'

module Unpacker

  class UnrecognizedArchiveError < StandardError; end
  class UnpackedFailedError < StandardError; end

  SUPPORTED_FILEEXTS = %w[tar rar zip gz bz tgz bgz tar]

  def self.unpack(file, tmpdir = "/tmp", &block) 
    Dir.mktmpdir 'unpacker' do |dir|
      cmd = command_by_file_ext(file)% [file, dir]
      system("#{cmd} 1>/dev/null") or raise UnrecognizedArchiveError($?)
      block.call(Dir.new(dir))
    end
  end

  def self.archive?(file_name)
    SUPPORTED_FILEEXTS.include? File.extname(file_name).sub('.', '')
  end

  def self.valid?(file_path, file_name = file_path)
    cmd = test_cmd_by_file_ext(file_name)% file_path
    system("#{cmd} 1>/dev/null 2>/dev/null")
  end

  # :stopdoc:
  VERSION = '1.0.1'
  LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  # :startdoc:

  # Returns the version string for the library.
  #
  def self.version
    VERSION
  end

  # Returns the library path for the module. If any arguments are given,
  # they will be joined to the end of the libray path using
  # <tt>File.join</tt>.
  #
  def self.libpath( *args )
    args.empty? ? LIBPATH : ::File.join(LIBPATH, args.flatten)
  end

  # Returns the lpath for the module. If any arguments are given,
  # they will be joined to the end of the path using
  # <tt>File.join</tt>.
  #
  def self.path( *args )
    args.empty? ? PATH : ::File.join(PATH, args.flatten)
  end

  # Utility method used to require all files ending in .rb that lie in the
  # directory below this file that has the same name as the filename passed
  # in. Optionally, a specific _directory_ name can be passed in such that
  # the _filename_ does not have to be equivalent to the directory.
  #
  def self.require_all_libs_relative_to( fname, dir = nil )
    dir ||= ::File.basename(fname, '.*')
    search_me = ::File.expand_path(
        ::File.join(::File.dirname(fname), dir, '**', '*.rb'))

    Dir.glob(search_me).sort.each {|rb| require rb}
  end

  private

  def self.test_cmd_by_file_ext(file_name)
    case file_name
    when /rar$/
      'unrar t "%s"'
    when /(tar|tar\.bz|tbz)$/
      'tar tf "%s"'
    when /zip$/
      'zip -T "%s"'
    when /gz|tgz$/
      'gunzip -t "%s"'
    else
      raise UnrecognizedArchiveError
    end
  end

  def self.command_by_file_ext(file_name)
    case file_name
    when /rar$/
      'unrar x -y "%s" "%s"'
    when /(tar|tgz|tar\.gz|tar\.bz|tbz)$/
      'tar xf "%s" --directory "%s"'
    when /zip$/
      'unzip "%s" -d "%s"'
    when /gz$/
      '(gunzip -c "%s" > "%s/gz-contents")'
    else
      raise UnrecognizedArchiveError
    end
  end

end  # module Unpacker

Unpacker.require_all_libs_relative_to(__FILE__)

# EOF
