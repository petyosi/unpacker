
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Unpacker do

  %w[file.rar file.tar file.tar.gz file.tgz file.tar.bz file.tbz file.zip].each do |file|
    it "should unpack #{file}" do
      fixture_archive(file).should be_unpacked_correctly_to('archive-contents')
    end

    it "should recognize #{file} as valid archive" do
      fixture_archive(file).should be_valid_archive
    end
  end

  %w[invalid-file.rar invalid-file.tar.gz invalid-file.zip invalid-file.gz].each do |file|
    it "should recognize #{file} as invalid archive" do
      fixture_archive(file).should_not be_valid_archive
    end
  end

  it "extracts gz" do
    fixture_archive('lipsum.txt.gz').should be_unpacked_correctly_to('gz-contents')
  end

  it "recognizes archive" do
    Unpacker.archive?(fixture_archive('test.tgz')).should be_true
  end

  it "recognizes other files" do
    Unpacker.archive?(fixture_archive('test.txt')).should be_false
  end

  def fixture_archive(file)
    File.join("spec", "fixtures", file)
  end

end
