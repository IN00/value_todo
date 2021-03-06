require_relative 'lib/value_todo/version'

Gem::Specification.new do |spec|
  spec.name          = 'value_todo'
  spec.version       = ValueTodo::VERSION
  spec.authors       = ['IN00']
  spec.email         = ['xxx@example.com']

  spec.summary       = %q{Sort todo by value and write value_todo.md}
  spec.description   = %q{Sort todo by value and write value_todo.md}
  spec.homepage      = 'https://github.com/IN00/value_todo'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = "Set to 'http://mygemserver.com' とあるが、rubygems.orgに公開したく無いのでこのまま"

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  p spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'motion-markdown-it'
  spec.add_runtime_dependency 'zeitwerk'
end
