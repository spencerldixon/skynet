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

Much more on the way soon!

### Skynet::Stats

A statistical analysis toolkit, initialise a new object an pass in an array that you'd like to analyse

```
a = [1,2,3,6,4,2,5,7,5,4,100,200]
skynet = Skynet::Stats.new(a)

skynet.mean
skynet.mode
skynet.median
skynet.variance
skynet.difference
skynet.standard_deviation
skynet.outliers
```

`mean`, `mode`, and `median` are self explanatory. `standard_deviation` is how far the numbers are spread out in relation to the mean. We can say that any datapoints more than one standard deviation from the mean, can be considered unusual, or an outlier. The `outliers` method will return a new array of these unusual datapoints that are less than or more than one standard deviation from the mean. `difference` will return an array of each elements difference from the mean.

### Skynet::Bayes

A Naive Bayesian Classifier, think your traditional spam/ham filter. Initialise a new object with your categories and start training your classifier

```
skynet = Skynet::Bayes.new("Spam", "Ham")
skynet.train("Spam", "FREE FREE FREE BUY ME!")
skynet.train("Ham", "I'll be back")

skynet.classify("Sarah Connor")
  => "Ham"
```
For ease of use, you can import a csv into the classifier instead of training manually...
```
skynet.train_from_csv("train_path", "test_path")
```
You can also test the accuracy of a trained classifier by passing in two csv's; One to train and one to test.

```
skynet = Skynet::Bayes.new("spam", "ham")
skynet.test_accuracy("/Users/train.csv", "/Users/test.csv")
```

It's a good idea to weight them with equal spam and ham to make it a fair trial. Both files will need labels. The classifier will train itself on the first dataset, and test its assumptions against the labels in the second test dataset, reporting back a number from 0 to 1, representing the accuracy of the classifiers trained guesses. Make the two datasets different, but equally weighted or you'll just get back an accuracy of 1 every time.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/spencerldixon/skynet.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

