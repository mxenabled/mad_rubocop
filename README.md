[![Dependency Status](https://gemnasium.com/mxenabled/mad_rubocop.svg)](https://gemnasium.com/mxenabled/mad_rubocop)

# MadRubocop

Custom RuboCop yml files to modify the cops enforced by RuboCop.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mad_rubocop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mad_rubocop

Add this to your project .rubocop.yml file:

```yml
inherit_gem:
  mad_rubocop: .rubocop.yml
```

NOTE: The `Exlude` setting on cops that only ignore certain files or directories cannot be set by MadRubocop.


## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mad_rubocop.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

