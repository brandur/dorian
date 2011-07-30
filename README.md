Dorian
======

A personal identity manager and aggregator written in Rails 3.1. A running demo is available at [brandur.org](http://brandur.org).

**Warning**: Currently in development status and prone to constant change!

Currently implemented modules for data aggregation:

* Blog via Atom feed
* Facts via JSON API
* GitHub via RSS feed
* GoodReads via XML API
* Twitter via RSS feed

Installation
------------

1. Clone this repository.

```
git clone https://github.com/brandur/dorian.git
```

2. From the new directory, bundle the project's dependencies with `bundle install --path .`.

3. Raise the database schema with `rake db:schema:load` (and remember to specify `RAILS_ENV` for the environment you want to deploy to).

3. Generate a new secret token initialier with `rake secret_deploy`.

4. Copy `config/app.rb.example` to `config/app.rb` and customize its contents.

5. Customize the views in `app/views` with your own information.

6. Update from all configured modules (e.g. Goodreads, Twitter, etc.) with `rake update` (again, specify `RAILS_ENV`).

7. Start WebBrick with `rails s` (with a `RAILS_ENV`) and go to [localhost:3000](http://localhost:3000), or deploy on a production Rails server like [Phusion Passenger](http://www.modrails.com/) or [Thin](http://code.macournoyer.com/thin/).

### Cron

Dorian uses [Whenever](https://github.com/javan/whenever) for Cron configuration. Install the whenever Gem on your system, then use it from the project directory to produce the lines that should go in your Crontab:

```
gem install whenever
whenever
```

