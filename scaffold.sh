#! /bin/sh

NEW_REPO=$1

bundle gem $NEW_REPO
cp ./sensu-plugins-disk-checks/*.md $NEW_REPO
cp ./sensu-plugins-disk-checks/.gitignore $NEW_REPO
cp ./sensu-plugins-disk-checks/.travis.yml $NEW_REPO
cp ./sensu-plugins-disk-checks/.rubocop.yml $NEW_REPO
cp ./sensu-plugins-disk-checks/Rakefile $NEW_REPO
cp ./sensu-plugins-disk-checks/Vagrantfile $NEW_REPO
cp ./sensu-plugins-disk-checks/*.gemspec $NEW_REPO
cp -R ./sensu-plugins-disk-checks/certs/* $NEW_REPO
sed -i '' 's/Matt Jones/devops@yieldbot.com/g' $NEW_REPO/LICENSE.txt  # specific to OSX
mkdir $NEW_REPO/bin
mkdir $NEW_REPO/test
mv $NEW_REPO/LICENSE.txt $NEW_REPO/LICENSE
