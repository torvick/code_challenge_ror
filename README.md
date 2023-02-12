<p align="center">
  <a href="https://rubyonrails.org/"><img width="300" src="https://zakaria.dev/assets/images/rails_base_app/Ruby_On_Rails_Logo.png" alt="Ruby On Rails"></a>
</p>

# Code Challenge RoR

[![](https://badgen.net/badge/Rails/7.0.4.2/red)](https://github.com/zakariaf/rails-base-app/blob/main/Gemfile.lock)



<!-- List of all topics -->

## Table of Contents

  - [📖 About the Project](#[project])
  - [💻 Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Clone the repo](#clone-the-repo)
    - [Install dependencies](#install-dependencies)
    - [Setup database](#setup-database)
    - [Run the app](#run-the-app)
  - [Extra](#extra)
    - [Deploy Production](#deploy-production)


## Project

It is a web application that allows users to import information from a flat file and save it in a database where it allows them to obtain a better organization, as well as obtain the total income that is had in each of the files.


## Getting Started

> To get a local copy up and running follow these simple steps.


### Prerequisites

  - <a href="https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-2-released/">Ruby 3.1.2</a>
  - <a href="https://rubyonrails.org/">Ruby on Rails 7</a>
  - <a href="https://www.postgresql.org/">PostgreSQL (at least version 9.3 installed)</a>


### 1. Clone the repo

```bash
git clone https://github.com/torvick/code_challenge_ror.git base_app
cd base_app
```

### 2. Install dependencies

```bash
bundle install # install ruby gems
yarn install # install node packages if its necesary
```

### 3. Setup database

```bash
bundle rails db:setup
```

### 4. Run the app

- Run the server

```bash
bundle rails s
```


## Extra

### Deploy Production

- <a href="https://github.com/capistrano/capistrano">Capistrano</a>:
  Capistrano is a remote server automation tool focusing mainly on Ruby web apps. It’s used to reliably deploy web apps to any number of remote machines by scripting arbitrary workflows over SSH and automate common tasks such as asset pre-compilation and restarting the Rails server.

### GitFlow

```
└── main
│      └── develop
│      │────────└── feature
│      │        │────────└── feature/task-description
└──────│        │        └── feature/task-description
│      │        │        └── feature/task-description
│      │        │        └── feature/task-description
│
└── main v 1.0.0
```
