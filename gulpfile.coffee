gulp = require 'gulp'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
sass = require 'gulp-ruby-sass'
concat = require 'gulp-concat'
mocha = require 'gulp-mocha'

gulp.task 'default', ['mocha']

gulp.task 'mocha', ->
  gulp.src(['test/*.coffee'], { read: false })
    .pipe(mocha(ui: 'tdd'))
    .on('error', gutil.log)

gulp.task 'dist', ->
  gulp.src(['src/lib/*.coffee', 'src/*.coffee'])
    .pipe(coffee(bare: true))
    .pipe(concat('jquery.jsonview.js'))
    .pipe(gulp.dest('dist'))

  gulp.src('src/*.scss')
    .pipe(sass())
    .pipe(gulp.dest('dist'))

gulp.task 'build', ->
  gulp.src('src/**/*.coffee')
    .pipe(coffee(bare: true))
    .pipe(gulp.dest('build'))

  gulp.src('src/*.scss')
    .pipe(sass())
    .pipe(gulp.dest('build'))


gulp.task 'watch', ->
  gulp.watch('src/**/*', ['build', 'mocha'])
