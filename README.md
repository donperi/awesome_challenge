# AwesomeChallenge

Example project of CLI app.

## Installation

Clone this repo

And then execute:

    $ bundle install

Rename/Duplicate `.env-example` into `.env` and setup Twitter configuration.

## Usage

Run `bundle exec bin/challenge` for list subcommands 

## Subcommands

`analyzer`: Run Twitter Analyzer.
Ex: `bundle exec bin/challenge analyzer`

Use `--force` to force Twitter fetch and ignore saved file.

`factors`: Run factors algorithm. 
Ex: `bundle exec bin/challenge factos 10,5,2,20`

