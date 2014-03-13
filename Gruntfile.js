/*
 *  @description configs for lz-fe develope project framework
 *  @author yuhao@taobao.com
 * */

var devModel = true,
    devPath = 'http://rap.alibaba-inc.com',
    realPath = 'http://liuliang.taobao.com'.
    dailyPath = 'http://liuliang.daily.taobao.net';

var LIVERELOAD_PORT = 9991;
var SERVER_PORT = 9966;

module.exports = function(grunt){

    // load all grunt tasks
    require('load-grunt-tasks')(grunt);

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        concat: {
            options: {
                separator: ';'
            },
            dist: {
                src: ['src/**/*.js'],
                dest: 'build/<%= pkg.name %>.js'
            }
        },
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n',
                mangle: true
            },
            build: {
                files: [{
                    expand: true,
                    cwd: 'build',
                    src: '**/*.js',
                    dest: 'build',
                    ext: '.min.js'
                }]
            },
            src: {
                files: [{
                    expand: true,
                    cwd: 'src',
                    src: '**/*.js',
                    dest: 'src',
                    ext: '.min.js'
                }]
            }
        },
        copy: {
            main: {
                options: {
                    //TODO: only filter html and jsp or other files except images type like png jpg gif
                    //process: function (content, srcpath) {
                    //    //return content.replace(/^\s*var devModel\s*=\s*[false|true|0|1]\s*;/gmi, "/* 这里曾经是开发模式切换的变量区域 */").replace(/devModel/, '');
                    //    return content;
                    //}
                },
                files: [{
                    expand: true,
                    cwd: 'src',
                    //TODO: filter directories folder
                    src: ['**', '!**/*.json', '!**/*.less'],
                    dest: 'build/src'
                }]
            },
            entryFile: {
                src: ['*.html', '*.htm', '*.jsp', '**/*.{html,htm,jsp}'],
                dest: 'build/',
                options: {
                    //process: function (content, srcpath) {
                    //    //filter path to build
                    //    var c = content.replace(/"src\//g, '"')
                    //    //filter css to concat and minify version
                    //    return c;
                    //}
                }
            }
        },
        qunit: {
            files: ['test/**/*.html']
        },
        jshint: {
            options: {
                //jshintrc: '.jshintrc',
                curly: false,
                eqeqeq: false,
                immed: false,
                latedef: false,
                newcap: false,
                noarg: true,
                sub: false,
                undef: false,
                unused: false,
                boss: false,
                eqnull: false,
                node: false,
                es5: false
            },
            globals: {
                jQuery: true,
                console: false,
                module: true,
                document: true
            },
            main: {
                files: {
                    src: ['*.js', 'src/**/*.js', 'build/**/*.js', '!src/**/*.min.js', '!build/**/*.min.js']
                }
            }
        },
        htmlmin: {
            build: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: [{
                    expand: true,
                    cwd: 'build',
                    src: ['*.{html,htm}', '**/*.{html,htm,jsp'],
                    dest: 'build'
                }]
            }
        },
        clean: ['build', '.tmp'],
        //imagemin: {
        //    dist: {
        //        files: [{
        //            expand: true,
        //            cwd: 'src/images',
        //            src: '{,*/}*.{png,jpg,jpeg}',
        //            dest: 'build/src/images'
        //        }]
        //    }
        //},
        cssmin: {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("dd-mm-yyyy") %> */\n',
            },
            minify: {
                expand: true,
                cwd: 'build/css/',
                src: ['*.css', '!*.min.css'],
                dest: 'build/css/'
                //ext: '.min.css'
            }
        },
        connect: {
            server: {
                options: {
                    hostname: 'localhost',
                    port: SERVER_PORT,
                    base: '.',
                    livereload: LIVERELOAD_PORT
                }
            }
        },
        watch: {
            less: {
                files: ['**/*.less', '!**/*.css'],
                tasks: ['less:watch']
            },
            //TODO: too many open files on MacOS bug
            //scripts: {
            //    files: ['**/*.js', '!**/*.min.js'],
            //    task: ['jshint']
            //},
            tmpl: {
                files: ['**/*.tpl']
            },
            options: {
                livereload: LIVERELOAD_PORT,
                spawn: true
            }
        },
        less: {
            options: {
                compress: true
            },
            watch: {
                files: [{
                    cwd: 'src/',
                    expand: true,
                    src: '**/*.less',
                    dest: 'src',
                    ext: '.less.css'
                }]
            }
        },
        open: {
            server: {
                path: 'http://localhost:<%= connect.server.options.port %>/'
            }
        }
    });

    //grunt.loadNpmTasks('grunt-contrib-imagemin');
    //grunt.loadNpmTasks('grunt-contrib-less');
    //grunt.loadNpmTasks('grunt-contrib-watch');
    //grunt.loadNpmTasks('grunt-contrib-cssmin');
    //grunt.loadNpmTasks('grunt-contrib-connect');
    //grunt.loadNpmTasks('grunt-contrib-clean');
    //grunt.loadNpmTasks('grunt-contrib-copy');
    //grunt.loadNpmTasks('grunt-contrib-htmlmin');
    //grunt.loadNpmTasks('grunt-contrib-uglify');
    //grunt.loadNpmTasks('grunt-contrib-jshint');
    //grunt.loadNpmTasks('grunt-contrib-qunit');
    //grunt.loadNpmTasks('grunt-contrib-watch');
    //grunt.loadNpmTasks('grunt-contrib-concat');

    grunt.registerTask('server', function (target) {
        if (target === 'build') {
            grunt.task.run([
                'build',
                'open',
                'connect:server'
            ]);
        }
        grunt.task.run([
            'open',
            'connect:server',
            'watch'
        ]);
    });
    grunt.registerTask('build', ['clean', 'less', 'copy', 'htmlmin', 'cssmin']);
    grunt.registerTask('pro', ['clean', 'copy', 'jshint', 'htmlmin', 'uglify:build']);
    grunt.registerTask('test', ['jshint', 'qunit']);
};
