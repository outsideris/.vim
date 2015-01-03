#!/bin/bash
cd ~/Documents/data/screenshots
$HOME/bin/lib/node.js/bin/pageres \
http://blog.outsider.ne.kr/ \
http://sideeffect.kr/popularconvention \
https://github.com/outsideris/ \
https://github.com/outsideris?tab=repositories \
https://github.com/outsideris/angular-summernote \
https://github.com/outsideris/popularconvention \
https://github.com/angular-ui/AngularJS-Atom \
http://stackoverflow.com/users/518864/outsider \
https://twitter.com/outsideris \
http://www.slideshare.net/rockdoli/presentations \
https://atom.io/packages/angularjs \
--delay 5 1366x3000 --filename '<%= date %>-<%= url %>'
