# Fgit

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/fgit`. To experiment with that code, run `bin/console` for an interactive prompt.

This tool is just make command more easy to use for file manipulating from branch to branch base on git command

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fgit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fgit

## Usage

* list all relative file paths in given branch by a filename or a regular expression of filename
* copy all files from given branch by a filename or a regular expression of filename

Commands:
  fgit ls BRANCH FILE_NAME

  fgit cp BRANCH FILE_NAME
    with --force -f option: force to copy all files without confirm and ignore unstaged local changes


## Contributing

Welcome any contrbutions to this project.

1. Fork it ( https://github.com/[my-github-username]/fgit/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
