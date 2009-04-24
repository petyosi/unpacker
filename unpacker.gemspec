# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{unpacker}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Petyo Ivanov"]
  s.date = %q{2009-04-24}
  s.description = %q{Small library for unpacking various archives, extracted from Beanstalk (http://beanstalkapp.com) (and rewritten, in fact).}
  s.email = %q{underlog@gmail.com}
  s.extra_rdoc_files = ["History.txt", "README.markdown"]
  s.files = ["History.txt", "README.markdown", "Rakefile", "lib/unpacker.rb", "test/fixtures/archive-contents/sample-file", "test/fixtures/file.rar", "test/fixtures/file.tar", "test/fixtures/file.tar.bz", "test/fixtures/file.tar.gz", "test/fixtures/file.tbz", "test/fixtures/file.tgz", "test/fixtures/file.zip", "test/fixtures/invalid-file.gz", "test/fixtures/invalid-file.rar", "test/fixtures/invalid-file.tar.gz", "test/fixtures/invalid-file.zip", "test/fixtures/lipsum.txt.gz", "test/test_helper.rb", "test/unpacker_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/underlog/unpacker}
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{unpacker}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Small library for unpacking various archives, extracted from Beanstalk (http://beanstalkapp}
  s.test_files = ["test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.4.2"])
    else
      s.add_dependency(%q<bones>, [">= 2.4.2"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.4.2"])
  end
end
