# Skynet
## A Machine Learning Library for Ruby

![Skynet Logo](https://theaviationist.com/wp-content/uploads/2013/03/Skynet.jpg)

Skynet is a statistical analysis and machine learning library for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'skynet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skynet

## Usage

Skynet is broken up into two parts so far...

`Skynet::Stats` : A statistical analysis tool offering things like `mean`, `mode`, `median`, `standard_deviation` and `variance`.
`Skynet::Bayes` : A Bayesian filter as used in the classic spam/ham detection

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/spencerldixon/skynet.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

