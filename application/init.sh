#!/bin/sh
# -*- coding: utf-8 -*-

# vim: set expandtab tabstop=4 shiftwidth=4 softtabstop=4:



HOME_DIR=/usr/share/fujimakishouten
APPLICATION_DIR=$HOME_DIR/homework

mkdir -p $HOME_DIR

cd $HOME_DIR
/usr/bin/git clone https://github.com/fujimaki-k/homework.git

cd $APPLICATION_DIR
/bin/sed --in-place --expression 's/localhost/mariadb/' $APPLICATION_DIR/src/main/resources/application.yml
$APPLICATION_DIR/gradlew --no-daemon bootRun



# Local variables:
# tab-width: 4
# c-basic-offset: 4
# c-hanging-comment-ender-p: nil
# End:

