# OptometristByTown

This ruby CLI progra is meant to get optometrist offices by town. The information that is given is the name of the office, the address and the town. The program scrapes from this webpage: https://www.opticaspr.com/pueblos_todos.php and dives in to each town link to get all the optometrist office.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'optometrist_by_town'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install optometrist_by_town

## Usage

To use this program make sure you have installed Nokogiri and Open-Uri. If runned in the learn IDE just require "nokogiri" and require "open-uri" in the top  will sufice. Type ruby bin/optometrist_cli to run the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'lite-unit-0160'/optometrist_by_town. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OptometristByTown project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'lite-unit-0160'/optometrist_by_town/blob/master/CODE_OF_CONDUCT.md).
