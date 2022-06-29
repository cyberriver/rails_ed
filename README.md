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
1. Bundle update

* Installing bootstrap CSS
application is used bootstrap 5.0 so you need install it and install compiler Esbuilder to compile assets

1. npm install bootstrap@3
2. add bootstrap gem to Gemfile
3. gem install esbuilder


* DB Configuration
to configure postgress - install postgress and create the proper role
1. sudo apt update
2. sudo apt install postgresql postgresql-contrib
#pls make sure that postgress has been started
3. sudo systemctl start postgresql.service
# create the role within postgress for your user
4. sudo -i -u postgres
# if you created without password, run psql console and change the password
5. sudo -u postgres psql
6. \password USERNAME

* Configure the security credentials pls run:

EDITOR="atom --wait" rails credentials:edit --environment=development
#put your credentials in opened credentials file which will be automatically encrypted after save operation
database:
  username: YOURUSERNAME_ROLE
  password: MODIFIEDPASSWORD_IN_PSSQL

* Database creation

after configuration run:
1. bin/rails db:setup
# to run seeds data
2. bin/rails db:migrate

* Mailer Configuration
set proper mailer credentials in rails config

* Database initialization

#Add new admin user:
1. Create user via User registration
2. Set manually in IRB console Admin type for it.

* How to run the test suite



* Deployment instructions

* ...
