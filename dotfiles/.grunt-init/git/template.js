// # git repository template for grunt-init
// default files for git repository such like .gitignore
//
// Copyright (c) 2013 JeongHoon Byun aka "Outsider", <http://blog.outsider.ne.kr/>
// Licensed under the MIT license.
// <http://outsider.mit-license.org/>
//

// Basic template description.
exports.description = 'Create basic files for git repository.';

// Template-specific notes to be displayed before question prompts.
exports.notes = 'added git files like .gitignore'

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '.gitignore';

// The actual init template.
exports.template = function(grunt, init, done) {
  
  init.process({}, [
    // Prompt for these values.
    {

      name: 'hasLicense',
      message: 'Do you add license file?',
      default: 'Y/n',
      warning: 'Yes: Minified file. No: Non-minified file.'
    },
    init.prompt('licenses'),
    init.prompt('author_name')
  ], function(err, props) {
    props.hasLicense = /y/i.test(props.hasLicense);

    // Files to copy (and process).
    var files = init.filesToCopy(props);

    // Add properly-named license files.
    if (props.hasLicense) {
      var licenses = ['MIT'];
      init.addLicenseFiles(files, licenses);
    }

    // Actually copy (and process) files.
    init.copyAndProcess(files, props);

    // All done!
    done();
  });

};
