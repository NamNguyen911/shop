# ssh ubuntu@ygm_demo "bash -s" < ./setup_server.sh

# dependencies
sudo apt-get update
sudo apt-get -y install git-core curl nginx zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs

# TODO rbenv, bundler not work
# install rbenv
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.4.0
rbenv global 2.4.0
ruby -v

rbenv rehash

# install Bundler
gem install bundler

# node js
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# rails
gem install rails -v 5.0.2

rbenv rehash

# TODO need to create user ygm and grant permission
sudo apt-get -y install mysql-server mysql-client libmysqlclient-dev

# TODO need to install image magick
