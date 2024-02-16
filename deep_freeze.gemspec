
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "deep_freeze/version"

Gem::Specification.new do |spec|
  spec.name          = "deep_freeze"
  spec.version       = DeepFreeze::VERSION
  spec.authors       = ["thandoncube1"]
  spec.email         = ["ncubethando20@gmail.com"]

  spec.summary       = %q{This gem allows the user securely protect objects in their project by stopping the mutation of frozen arrays and hashes. This is good when trying to have clearly defined structres in an application to reduce buggy code.}
  spec.description   = %q{What does it mean for an object to be mutable?

  Don’t let fancy words confuse you, “mutability” just means that an object’s internal state can be changed. This is the default of all objects, excluding those that have been frozen, or those that are part of a list of special objects.
  
  In other words, not all objects in Ruby are mutable!
  
  For example:
  
  It doesn’t make any sense for numbers or symbols, or even true or false (which are also objects) to change.
  
  The number 1 is always going to be 1.
  
  But other objects, especially those that are meant to store data, like Array or Hash objects, should have the ability to change for performance reasons.
  
  What’s the alternative?
  
  You can make a new copy of an object with the changes & then return this new object, leaving the original object intact.
  
  If arrays were immutable and you wanted to change just one element of an array, you would have to copy all the data, including the elements that didn’t change. 
  
  Cloning Objects
  One way to deal with this issue is to use the dup method.
  
  This will tell Ruby to give you a copy of the object. There is also a clone method, which in addition to giving you a copy of the object, it copies the frozen status & any singleton methods defined on the object.
  
  }
  spec.homepage      = "https://github.com/thandoncube1"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/thandoncube1"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
end
