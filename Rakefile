require "rubygems"
require "hoe"

require "./lib/intercession/version.rb"

Hoe.new "intercession", Intercession::VERSION do |p|
  p.developer "John Barnette", "jbarnette@rubyforge.org"

  p.url              = "http://github.com/jbarnette/intercession"
  p.history_file     = "CHANGELOG.rdoc"
  p.readme_file      = "README.rdoc"
  p.extra_rdoc_files = [p.readme_file]
  p.need_tar         = false
  p.test_globs       = %w(test/**/*_test.rb)
  p.testlib          = :minitest
end
