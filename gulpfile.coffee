gulp = require "gulp"
spider = require "gulp-spider-script"

sources =
  spider: "src/spider/**/*.spider"


destinations =
  root: "dist"

gulp.task "clean", ->
  gulp.src(destinations.root, {read: false}).pipe clean()

gulp.task "spider", ->
  gulp.src sources.spider
  .pipe spider()
  .pipe gulp.dest destinations.root

gulp.task "watch", ->
  gulp.watch [sources.spider], ["spider"]
