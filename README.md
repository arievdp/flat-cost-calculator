# Flat Splitter

A personal project to split housing costs between flatmates.

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
git clone git@github.com:erik-trantt/govhack-2020.git

# install dependencies
cd govhack-2020
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



&#169; 2020 Gone With The Win
