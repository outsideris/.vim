// # git repository template for grunt-init
// default files for git repository such like .gitignore
//
// Copyright (c) 2013 JeongHoon Byun aka "Outsider", <http://blog.outsider.ne.kr/>
// Licensed under the MIT license.
// <http://outsider.mit-license.org/>
//

// Basic template description.
exports.description = 'Create basic files for front-end project';

// Template-specific notes to be displayed before question prompts.
exports.notes = 'Gruntfile, bower and package.json'

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = 'Gruntfile.js';
exports.warnOn = '.bowerrc';
exports.warnOn = 'bower.json';
exports.warnOn = 'package.json';

// The actual init template.
exports.template = function(grunt, init, done) {
  
  init.process({}, [
    // Prompt for these values.
  ], function(err, props) {
    // Files to copy (and process).
    var files = init.filesToCopy(props);

    // Actually copy (and process) files.
    init.copyAndProcess(files, props);

    // All done!
    done();
  });

};
