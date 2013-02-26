// # Download jQuery files 
// donwload jquery.js or minified jquery.js you specify version
//
// Copyright (c) 2013 JeongHoon Byun aka "Outsider", <http://blog.outsider.ne.kr/>
// Licensed under the MIT license.
// <http://outsider.mit-license.org/>
//

var path = require('path')
  , fs = require('fs')
  , http = require('http');

// Basic template description.
exports.description = 'Download jquery file';

// Template-specific notes to be displayed before question prompts.
exports.notes = 'Download jquery you specify';

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '**/jquery.*.js';

// The actual init template.
exports.template = function(grunt, init, done) {

  var LASTEST_VERSION = '1.9.1';

  init.process({}, [
    // Prompt for these values.
    {
      name: 'version',
      message: 'What version for jQuery do you need?',
      default: LASTEST_VERSION
    },
    {
      name: 'min',
      message: 'Do you want minified jQuery file?',
      default: 'Y/n',
      warning: 'Yes: Minified file. No: Non-minified file.'
    },
    {
      name: 'targetPath',
      message: 'Where do you want to download a jQuery file? (relative path)',
      default: './'
    }
  ], function(err, props) {
//    props.version = semver.valid(props.version) || LASTEST_VERSION;
    props.min = /y/i.test(props.min);
    props.targetPath = path.relative('./', props.targetPath);

    // initialize constants
    var JQUERYPATH = path.join(__dirname, 'root', props.version + (props.min ? '-min' : ''));
    var JQUERYFILE = 'jquery-' + props.version + (props.min ? '.min' : '') + '.js'

    fs.exists(JQUERYPATH, function(exists) {
      if (exists) {
        writeFileThenEnd();
      } else {
        getJQueryFile(writeFileThenEnd);
      }
    });

    var writeFileThenEnd = function() {
      // Files to copy (and process).
      var files = init.filesToCopy(props);
      for (file in files) {
        var toRemovePrefix = path.join(props.version + (props.min ? '-min' : ''), '/');
        if (file.indexOf(toRemovePrefix) === 0) {
          var newKey = file.replace(toRemovePrefix, path.normalize(props.targetPath) + '/');
          files[newKey] = files[file];
          delete files[file];
        } else {
          delete files[file];
        }
      }

      // Actually copy (and process) files.
      init.copyAndProcess(files, props);

      // All done!
      done();
    };

    var getJQueryFile = function(callback) {
      fs.mkdir(JQUERYPATH, function(err) {
        http.get('http://code.jquery.com/' + JQUERYFILE, function(response) {
          var file = fs.createWriteStream(JQUERYPATH + '/' + JQUERYFILE);
          response.on('data', function(chunk) {
            file.write(chunk);
          }).on('end', function() {
            file.end();
            callback();
          });

          if (err || response.statusCode !== 200) {
            fs.rmdir(JQUERYPATH);
            grunt.log.writeln().fail("Aborted due to can't find the jQuery file. Check the version - " + props.version);
          }
        });
      });
    };
  });

};
