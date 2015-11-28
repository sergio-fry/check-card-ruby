# CardValidator

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/card_validator`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'card_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install card_validator

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


# Checking Credit Cards

Before a credit card is submitted to a financial institution, it generally makes sense to run some simple reality checks on the number. The numbers are a good length and it's common to make minor transcription errors when the card is not scanned directly.

The first check people often do is to validate that the card matches a known pattern from one of the accepted card providers. Some of these patterns are:


| Card Type  | Begins With | Number Length |
|------------|-------------|---------------|
| AMEX       | 34 or 37    | 15            |
| Discover   | 6011        | 16            |
| MasterCard | 51-55       | 16            |
| Visa       | 4           | 13 or 16      |

All of these card types also generate numbers such that they can be validated by the Luhn algorithm, so that's the second check systems usually try. The steps are:

1. Starting with the next to last digit and continuing with every other
   digit going back to the beginning of the card, double the digit
2. Sum all doubled and untouched digits in the number
3. If that total is a multiple of 10, the number is valid

For example, given the card number 4408 0412 3456 7893:

    Step 1:  8 4 0 8 0 4 2 2 6 4 10 6 14 8 18 3
    Step 2:  8+4+0+8+0+4+2+2+6+4+1+0+6+1+4+8+1+8+3 = 70
    Step 3:  70 % 10 == 0

Thus that card is valid.

Let's try one more, 4417 1234 5678 9112:

    Step 1:  8 4 2 7 2 2 6 4 10 6 14 8 18 1 2 2
    Step 2:  8+4+2+7+2+2+6+4+1+0+6+1+4+8+1+8+1+2+2 = 69
    Step 3:  69 % 10 != 0

That card is not valid.

This week's Ruby Quiz is to write a program that accepts a credit card number as a command-line argument. The program should print the card's type (or Unknown) as well a Valid/Invalid indication of whether or not the card passes the Luhn algorithm.
=======
