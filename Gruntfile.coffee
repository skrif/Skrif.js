module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    meta:
      file: 'skrif'
      endpoint: 'package',
      banner: '/* <%= pkg.name %> v<%= pkg.version %> - <%= grunt.template.today("yyyy/m/d") %>\n' +
              '   <%= pkg.homepage %>\n' +
              '   Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>' +
              ' - Licensed under <%= pkg.license %> */\n'

    resources:
      src: [
        'src/**/*.coffee'

      ]

    browserify: 
      debug: 
        files: 
          'dist/<%= meta.file %>-debug.js': ['index.js']
        options: 
          debug: true
          # external: [require.resolve('jquery')]

    uglify:
      options:
        compress: false
        banner: '<%= meta.banner %>'
      endpoint:
        files: 
          'dist/<%=meta.file%>.js':      'dist/<%= meta.file %>.js',
          'dist/<%=meta.file%>-full.js': 'dist/<%= meta.file %>-full.js'

    coffee:
      node: 
        src: ['**/*.coffee']
        cwd: 'src'
        dest: 'lib/'
        expand: true
        ext: '.js'
        options:
          bare: true

    stylus:
      compile: 
        options:
          compress: true
        files: 
          'dist/skrif.css': ['src/css/*.styl'] 

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-coffeeify'
  grunt.loadNpmTasks 'grunt-contrib-stylus'

  grunt.registerTask 'browser', ['coffee:node', 'browserify:debug', 'browserify:full', 'browserify:dist', 'stylus']
  grunt.registerTask 'demo',    ['coffee:node', 'browserify:debug', 'stylus']
  grunt.registerTask 'default', ['browser']
