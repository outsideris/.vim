/*
 * grunt
 * http://gruntjs.com/
 *
 * Copyright (c) 2012 "Cowboy" Ben Alman
 * Licensed under the MIT license.
 * https://github.com/gruntjs/grunt/blob/master/LICENSE-MIT
 */

// Basic template description.
exports.description = 'Create basic files for git repository.';

// Template-specific notes to be displayed before question prompts.
exports.notes = 'added git files like .gitignore'

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '.gitignore';

// The actual init template.
exports.template = function(grunt, init, done) {

  grunt.helper('prompt', {}, [
  ], function(err, props) {
    // Files to copy (and process).
    var files = init.filesToCopy(props);

    // Actually copy (and process) files.
    init.copyAndProcess(files, props);

    // All done!
    done();
  });

};
