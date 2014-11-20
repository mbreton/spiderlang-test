gulp = require "gulp"
spider = require "gulp-spider-script"
rename = require "gulp-rename"

sources =
  spider: "src/spider/**/*.spider"
  html : "src/*.html"
  vendors : "src/vendors/**/*.js"

destinations =
  root: "dist"
  vendors : "dist/vendors"

gulp.task "clean", ->
  gulp.src(destinations.root, {read: false}).pipe clean()

gulp.task "copy", ->
  gulp.src(sources.html).pipe gulp.dest destinations.root
  gulp.src(sources.vendors).pipe gulp.dest destinations.vendors

gulp.task "spider", ->
  gulp.src sources.spider
  .pipe spider()
  .pipe rename(extname: ".js")
  .pipe gulp.dest destinations.root

gulp.task "watch", ->
  gulp.watch [sources.spider], ["spider"]
  gulp.watch [sources.html], ["copy"]

gulp.task "default", ["spider", "copy", "watch"]

