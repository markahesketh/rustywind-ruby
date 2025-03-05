# Rustywind::Ruby

[Rustywind](https://github.com/avencera/rustywind/) is a CLI utility for sorting Tailwind CSS classes. 

This gem wraps the `rustywind` executable in a Ruby gem, allowing it to be easily installed and used in Ruby projects.

### Why Rustywind?
While [Tailwind CSS recommends Prettier for sorting CSS classes](https://tailwindcss.com/blog/automatic-class-sorting-with-prettier), a node-based build setup is required. Rustywind is self-contained and ideal for #nobuild setups. Its also fast.

## Installation

To install the gem and add it to your application's Gemfile, execute:

```bash
bundle add rustywind-ruby
```

If Bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install rustywind-ruby
```

## Usage

```
bundle exec rustywind
```

Refer to the [Rustywind documentation](https://github.com/avencera/rustywind/blob/master/README.md#usage) for available options.

## Development

### Local Setup 
- Run `bin/setup` to install dependencies.
- Run `rake test` to run the tests. 
- You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Releasing a new version

- Update the version number in `upstream.rb` and `version.rb`
- Run `bundle exec rake clobber`
- Run `bundle exec rake download_binaries`
- Commit any changes and update changelog
- Run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org)
- Draft a new release on [GitHub](https://github.com/markahesketh/rustywind-ruby/releases)

## Versioning

Versions of this library are based on the upstream Rustywind library. For additional releases of this library for the same version of Rustywind, an additional digit will be used.

# Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/markhesketh/rustywind-ruby](https://github.com/markahesketh/rustywind-ruby).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

This project also includes code from the upstream Rustywind library, which is available under its own license. For more details, see the [Rustywind license](https://github.com/avencera/rustywind/blob/main/LICENSE).
