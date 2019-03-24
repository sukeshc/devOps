echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i puppetlabs-release-pc1-xenial.deb
sudo apt-get update
sudo apt-get install -y puppet-agent git
sudo ln -s /opt/puppetlabs/bin/puppet /usr/bin/puppet
sudo puppet module install rtyler-jenkins
sudo puppet module install hubspot-nexus
sudo puppet module install maestrodev-sonarqube

wget https://raw.githubusercontent.com/sukeshc/devOps/master/release/puppet/modules/jenkins.pp
wget https://raw.githubusercontent.com/sukeshc/devOps/master/release/puppet/modules/nexus.pp
wget https://raw.githubusercontent.com/sukeshc/devOps/master/release/puppet/modules/sonar.pp
sudo puppet apply jenkins.pp
sudo apt-get install -y maven
sudo puppet apply nexus.pp
sudo puppet apply sonar.pp
sudo echo "sonar.embeddedDatabase.port:               9092" >> /usr/local/sonar/conf/sonar.properties
sudo /etc/init.d/sonar start
sudo rm -f /etc/maven/settings.xml

