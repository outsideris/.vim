/*
 * grunt
 * http://gruntjs.com/
 *
 * Copyright (c) 2012 "Cowboy" Ben Alman
 * Licensed under the MIT license.
 * https://github.com/gruntjs/grunt/blob/master/LICENSE-MIT
 */

// Basic template description.
exports.description = 'Create skeleton with sbt for Scala project.';

// Template-specific notes to be displayed before question prompts.
exports.notes = 'added sbt setting files and directories'

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '*';

// The actual init template.
exports.template = function(grunt, init, done) {

  var LASTEST_SCALA_VERSION = "2.10.0"
  var LASTEST_SBT_VERSION = "0.12.0"

  grunt.helper('prompt', {}, [
    grunt.helper('prompt_for', 'name'),
    grunt.helper('prompt_for', 'version'),
    {
      name: 'scalaversion',
      message: 'What scala version are you underlying?',
      default: LASTEST_SCALA_VERSION 
    },
    {
      name: 'sbtversion',
      message: 'What is your sbt version?',
      default: LASTEST_SBT_VERSION 
    }
  ], function(err, props) {
    // Files to copy (and process).
    var files = init.filesToCopy(props);

    // Actually copy (and process) files.
    init.copyAndProcess(files, props);

    // All done!
    done();
  });

};
