# Rucc

C-compiler written in Ruby.

## Project Goal

For learning about compiler, for creating hackable C-compiler, for creating benchmark target of CRuby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rucc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rucc

## Usage
`rucc` compiles c code and prints assembler source code. Tested only in Linux (Ubuntu 17.04).

```ruby
rucc test.c
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## TODO
- [ ] Build CRuby
  - [ ] Enable file and line in error message (errort and errorp)
- [ ] Refactor
- [ ] Add some CLI options
  - [ ] Integrate with assembler
- [ ] Impl some features
  - [ ] Support parentheses around function name

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/south37/rucc.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Thanks
This project is highly inspired by [8cc](https://github.com/rui314/8cc). Thanks to rui314!
