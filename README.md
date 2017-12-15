# FakeNewsCliGem

This gem was created as a project for Learn.co. It scrapes FactCheck.org/fake-news and creates objects for the 10 latest "Fake News" category articles.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fake_news_cli_gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake_news_cli_gem

## Usage

After you <code>bundle install</code> the gem you can simply run <code>bin/fake-news</code>.

Once ran the gem initially lists 10 teaser articles.

You have a few options from this point which are clearly listed. If you find an article that you would like to read simple type "<code>y</code>" and then it requires and article number or ID. After you input the article you would like to read it is returned.

After you have read the article you have the option of opening the webpage. If you choose not to read the webpage it returns to the initial options of "<code>list</code>"ing the article teasers or "<code>exit</code>"ing the CLI.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joshuaneedham/fake_news_cli_gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FakeNewsCliGem project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/joshuaneedham/fake_news_cli_gem/blob/master/CODE_OF_CONDUCT.md).
