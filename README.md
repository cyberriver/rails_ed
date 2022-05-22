# README

#LMS system is being designed for ligth and fast configration and passing the tests.
#Systems based on Rails 7 for Ubuntu 20.04 as a serverside

#Installation process for Ubuntu 20.04

# install RVM (Ruby Version Manager)
  link -> rvm.io


* install ruby (version 3.0.3)
  rvm install 3.0.3

  Note: if you see such error when switching between rubies
  "
  RVM is not a function, selecting rubies with 'rvm use ...' will not work.
  You need to change your terminal emulator preferences to allow login shell.
Sometimes it is required to use `/bin/bash --login` as the command.
Please visit https://rvm.io/integration/gnome-terminal/ for an example.

  "

  you need
  1)
    Open console
    Select Edit -> Profile Preferences
    Select tab: Title and Command
    Check box 'Run command as a login shell'
    Restart terminal

  2)
  run:
  echo 'source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
  3) in a case if it doesn't work Run
  source $HOME/.profile

  then run

  rvm use 3.0.3

* install Database SQLite3 from SQLite3.org (usually it already installed on Unix like system)

* install Node.js (v16 and higher) and node modules
  go to nodejs.org and install Node

  to upgrade Run
  sudo npm install -g n
  sudo n stable

* install npm (6.14.4) (Node package Manager)
  During install Node pls install npm

* install yarn package manager
if you have yarn version 1 and lower pls migration to highest

1. Run npm install -g yarn to update the global yarn version to latest v1
2. Go into your project directory
3. Run yarn set version berry to enable v2 (cf Install for more details)
4. If you used .npmrc or .yarnrc, you'll need to turn them into the new format (see also 1, 2)
5. Add nodeLinker: node-modules in your .yarnrc.yml file
6. Commit the changes so far (yarn-X.Y.Z.js, .yarnrc.yml, ...)
7. Run yarn install to migrate the lockfile
8. Take a look at this article to see what should be gitignored
9. Commit everything remaining

after run:
yarn install

NOTE!:
After installing yarn pls don't forget to install yarn plugin by running script
  yarn plugin import interactive-tools
  yarn upgrade

* Ruby Gems
don't forget to run bundle upgrade

* Installing bootstrap
application is used bootstrap 5.0 so you need install it and install compiler Esbuilder to compile assets

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
