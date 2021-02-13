# Installation


## Requirements

- [Ruby](https://www.ruby-lang.org/)
- [Bundler](https://bundler.io)

For convenience, this project used [GNU Make](https://www.gnu.org/software/make/), which is standard on Linux and macOS. If you do not have it on Windows, you can skip `make` commands and use the more verbose commands supplied in the docs of this project.


## Install system dependencies

Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems).

Install Bundler as gem for your user.

```sh
$ gem install bundler --user-install
```

Some people prefer to _omit_ the `--user-install` flag, but, then you need access to install to a shared `/usr/lib/ruby` directory, which could require use of `sudo` to run the `gem` command. In that case, rather change permissions on `/usr/lib/ruby` directory to be writable by all users, so you never have to run `sudo gem ...`.


## Clone

Clone the repo or your repo copied from the template.

```sh
$ git clone git@github.com:MichaelCurrin/jekyll-actions-quickstart.git
$ cd jekyll-actions-quickstart
```


## Install project packages

If you want to use `make`:

```sh
$ make install
```

Or configure Bundler in your project.

```sh
$ bundle config set --local path vendor/bundle
```

Then install project dependencies using Bundler. This will include Jekyll 4.

```sh
$ bundle install
```
