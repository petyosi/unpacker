require 'shellshot'
require 'fileutils'
require 'tmpdir'

module Unpacker

  class UnrecognizedArchiveError < StandardError; end

  SUPPORTED_FILEEXTS = %w[tar rar zip gz bz tgz bgz tar]

  def self.unpack(file, tmpdir = "/tmp", &block)
    Dir.mktmpdir 'unpacker' do |dir|
      case file
      when /rar$/
        Shellshot.exec [ "unrar", "x", "-y", file, dir ], :stdout => false
      when /(tar|tgz|tar\.gz|tar\.bz|tbz)$/
        Shellshot.exec [ "tar", "xf", file, "--directory", dir ], :stdout => false
      when /zip$/
        Shellshot.exec [ "unzip", file, "-d", dir ], :stdout => false
      when /gz$/
        Shellshot.exec [ "gunzip", "-c", file ], :stdout => File.join(dir, "gz-contents")
      else
        raise UnrecognizedArchiveError
      end

      block.call(Dir.new(dir))
    end
  end

  def self.archive?(file_name)
    SUPPORTED_FILEEXTS.include? File.extname(file_name).sub('.', '')
  end

  def self.valid?(file_path, file_name = file_path)
    cmd = case file_name
          when /rar$/
            [ 'unrar', 't', file_path ]
          when /(tar|tar\.bz|tbz)$/
            [ 'tar', 'tf', file_path ]
          when /zip$/
            [ 'zip', '-T', file_path ]
          when /gz|tgz$/
            [ 'gunzip', '-t', file_path ]
          else
            raise UnrecognizedArchiveError
          end
    Shellshot.exec cmd, :stdall => false
    true
  rescue
    false
  end

end  # module Unpacker

