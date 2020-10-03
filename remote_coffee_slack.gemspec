require_relative 'lib/remote_coffee_slack/version'

Gem::Specification.new do |spec|
  spec.name          = "remote-coffee-slack"
  spec.version       = RemoteCoffeeSlack::VERSION
  spec.authors       = ["Juan Carlos Ruiz"]
  spec.email         = ["JuanCrg90@gmail.com"]

  spec.summary       = %q{Organize remote coffee pairs in your slack workspace.}
  spec.description   = %q{Organize remote coffee pairs in your slack workspace.}
  spec.homepage      = "https://calzadacode.dev/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Calzada-Code/remote-cofee-slack"
  spec.metadata["changelog_uri"] = "https://github.com/Calzada-Code/remote-cofee-slack"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
