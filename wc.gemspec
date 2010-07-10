# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wc}
  s.version = "0.94.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paolo Perego"]
  s.date = %q{2010-07-10}
  s.default_executable = %q{wc}
  s.description = %q{your ruby word counter experience}
  s.email = %q{thesp0nge@gmail.com}
  s.executables = ["wc"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/wc",
     "lib/wc.rb",
     "test/helper.rb",
     "test/test_wc.rb",
     "wc.gemspec"
  ]
  s.homepage = %q{http://github.com/thesp0nge/wc}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{your ruby word counter experience}
  s.test_files = [
    "test/helper.rb",
     "test/test_wc.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<builder>, [">= 2.1.2"])
      s.add_development_dependency(%q<json>, [">= 1.4.3"])
      s.add_runtime_dependency(%q<json>, [">= 1.4.3"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<json>, [">= 1.4.3"])
      s.add_dependency(%q<json>, [">= 1.4.3"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<json>, [">= 1.4.3"])
    s.add_dependency(%q<json>, [">= 1.4.3"])
  end
end

