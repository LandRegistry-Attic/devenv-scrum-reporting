echo "- - - Installing RVM - - -"
curl -sSL https://rvm.io/mpapis.asc | gpg --import - && \curl -sSL https://get.rvm.io | bash -s stable
source "/home/vagrant/.rvm/scripts/rvm"
echo "- - - Gems will install without docs for this environment - - -"
echo "gem: --no-rdoc --no-ri" > ~/.gemrc

#make sure RVM gets run when starting a
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"' >> ~/.bash_profile

echo "- - - Enabling gem globalcache..."
rvm gemset globalcache enable

echo "- - - Installing JRuby..."
rvm install jruby-1.7.19

echo "- - - Installing Ruby - - -"
rvm install ruby-1.9.3

echo "- - - Give Vagrant ownership of RVM and Gem directories - - -"
sudo chown -R vagrant /home/vagrant/.rvm
sudo chown -R vagrant /home/vagrant/.gem

echo "- - - Installing Bundler in JRuby - - -"
rvm use jruby-1.7.19
gem install bundler --no-rdoc --no-ri

echo "- - - Installing Bundler in Ruby - - -"
rvm use ruby-1.9.3
gem install bundler --no-rdoc --no-ri

echo "- - - Switch back to JRuby - - -"
rvm use jruby-1.7.19
