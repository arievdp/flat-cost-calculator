# Flat Splitter

A personal project (work in progress) that splits housing costs between flatmates. I built this over a weekend to experiment with Tailwind CSS and social link sharing.

Flat Splitter uses:
- Ruby on Rails
- Tailwind CSS
- Devise for authentication
- Omniauth for social logins

## Installation
This app needs Ruby version 2.6.6 on your computer. If you need help with installing Ruby using `rbenv`, you can follow this [guide](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04#step-1-%E2%80%93-install-rbenv-and-dependencies).

## Setup

```bash
# clone the repo
git clone git@github.com:arievdp/flat-cost-calculator.git

# install dependencies
cd flat-cost-calculator
bundle install
yarn install --check-files

# run app for first time
rails db:migrate db:create

# populate sample data
rails db:seed
```

## Run the app
```bash
# starting the server
rails server

# alternatively, can use this shortcut
rails s
```
