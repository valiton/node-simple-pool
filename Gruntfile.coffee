# Basic vInsight-lib-module configuration
module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    coffeelint:
      app: ["src/**/*.coffee"]
      options:
        max_line_length:
          value: 1000
          level: "error"

    clean:
      before:
        src: ["lib", "reports", "doc"]

      spec:
        src: ["spec-lib"]

    coffee:
      compile:
        options:
          bare: true
        files: [
          {expand: true, cwd: './src', src: ['**/*.coffee'], dest: './lib', ext: '.js'},
          {expand: true, cwd: './spec', src: ['**/*.coffee'], dest: './spec-lib', ext: '.spec.js'}
        ]

    jasmine_node:
      projectRoot: "./spec-lib"
      jUnit:
        report: true
        savePath: "reports/"
        useDotNotation: true
        consolidate: false

    jsdoc:
      dist:
        src: ['lib/*.js'],
        options:
          destination: 'doc'

    connect:
      server:
        options:
          hostname: "0.0.0.0"
          port: 9000


  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-jasmine-node"
  grunt.loadNpmTasks "grunt-jsdoc"

  grunt.registerTask "default", ["clean:before", "coffee", "connect", "jasmine_node", "clean:spec", "jsdoc"]