require File.join(File.dirname(__FILE__), 'test_helper')

class UnpackerTest < Test::Unit::TestCase

  def test_extracting_files()
    files.each do |target|
      file = fixture_archive(target)
      Unpacker.unpack(file) do |result|
        assert result.entries.include?('archive-contents'), "#{target} was not extracted properly - entries contained #{result.entries.inspect}"
      end
    end
  end

  def test_extracting_gz
    Unpacker.unpack(fixture_archive('lipsum.txt.gz')) do |result|
      assert result.entries.include?('gz-contents'), "gz extracting did not work"
    end
  end

  def test_valid_files
    (files + ['lipsum.txt.gz']).each do |file|
      assert Unpacker.valid? fixture_archive(file)
    end
  end

  def test_invalid_files
    invalid_files.each do |file|
      assert ! Unpacker.valid?(fixture_archive(file))
    end
  end

  private 

  def files
    %w[file.rar file.tar file.tar.gz file.tgz file.tar.bz file.tbz file.zip]
  end

  def invalid_files
    %w[invalid-file.gz invalid-file.rar invalid-file.tar.gz invalid-file.zip]
  end
end
