lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "bpx_client/version"

Gem::Specification.new do |spec|
  spec.name          = "bpx_client"
  spec.version       = BpxClient::VERSION
  spec.authors       = ["Jim Boone"]
  spec.email         = ["boone.jim@gmail.com"]

  spec.summary       = %q{Payrailz BPX Integration Client}
  spec.description   = %q{Payrailz intends to fully integrate with Mastercard’s Bill Payment Exchange (BPX) product and has engaged Levvel to assist in that effort.}
  spec.homepage      = "https://github.com/GetLevvel/payrailz-bpx_client-integration-client"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.6")

  spec.metadata["allowed_push_host"] = "http://payrailz.com"

  spec.metadata["homepage_uri"] = "https://github.com/GetLevvel/payrailz-bpx_client-integration-client"
  spec.metadata["source_code_uri"] = "https://github.com/GetLevvel/payrailz-bpx_client-integration-client"
  spec.metadata["changelog_uri"] = "https://github.com/GetLevvel/payrailz-bpx_client-integration-client"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
