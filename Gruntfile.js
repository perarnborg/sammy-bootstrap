module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    sass: {
      run: {
        options: {
          loadPath: require('node-bourbon').includePaths,
          style: 'expanded',
        },
        files: {
          'css/app.css' : 'css/application.scss'
        }
      },
      build: {
        options: {
          loadPath: require('node-bourbon').includePaths,
          style: 'compressed',
        },
        files: {
          'css/app.min.css' : 'css/application.scss'
        }
      }
    },
    coffee: {
      run: {
        options: {
        },
        files: {
          'js/application.js': [
            'js/_base/main.coffee',
            'js/_base/routes.coffee',
            'js/_helpers/*.coffee',
            'js/_controllers/*.coffee',
            'js/_components/*.coffee'
          ]
        }
      }
    },

    uglify: {
      my_target: {
        files: {
          'js/application.min.js': ['js/application.js'],
          'js/libs/handlebars-2.0.0.min.js': ['js/libs/handlebars-2.0.0.js']
        }
      }
    },

    concat: {
      options: {
        stripBanners: true,
        separator: ';'
      },
      run: {
        src: [
          'js/libs/jquery-2.1.1.min.js',
          'js/libs/underscore-1.7.0.min.js',
          'js/libs/handlebars-2.0.0.js',
          'js/libs/sammy/sammy.js',
          'js/libs/sammy/plugins/sammy.handlebars.js',
          'js/application.js'
        ],
        dest: 'js/app.js'
      },
      build: {
        src: [
          'js/libs/jquery-2.1.1.min.js',
          'js/libs/underscore-1.7.0.min.js',
          'js/libs/handlebars-2.0.0.min.js',
          'js/libs/sammy/min/sammy-0.7.6.js',
          'js/libs/sammy/min/plugins/sammy.handlebars-0.7.6.js',
          'js/application.min.js'
        ],
        dest: 'js/app.min.js'
      }
    },

    watch: {
      css: {
        files: ['css/application.scss', 'css/**/*.scss'],
        tasks: ['sass:run']
      },
      scripts: {
        files: ['js/main.coffee', 'js/routes.coffee', 'js/**/*.coffee'],
        tasks: ['coffee', 'concat:run']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-concat');

  grunt.registerTask('default', ['sass:run', 'coffee', 'concat:run', 'watch']);
  grunt.registerTask('build', ['sass:build', 'coffee', 'concat:build', 'uglify']);
};
