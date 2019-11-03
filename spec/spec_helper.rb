require "mad_rubocop"

require "rubocop/rspec/support"

::RSpec.configure do |config|
  config.order = "random"
  config.include ::RuboCop::RSpec::ExpectOffense
end
