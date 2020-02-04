var gulp = require("gulp"),
uglify = require("gulp-uglify"),
concat = require("gulp-concat"),
sass = require("gulp-sass"),
imagemin = require("gulp-imagemin"),
jquery = require("jquery");

// Bootstrap task
gulp.task("sass", function() {
  return gulp.src([
    "node_modules/bootstrap/scss/bootstrap.scss",
    "src/scss/main.scss"
  ])
  .pipe(sass({
    outputStyle: "compressed"
  }).on("error", sass.logError))
  .pipe(concat("main.css"))
  .pipe(gulp.dest("dist/styles"));
});

// Scripts task
// Uglifies
gulp.task("scripts", function() {
  return gulp.src([
    "node_modules/jquery/dist/jquery.min.js",
    "src/js/*.js"
  ])
  .pipe(concat("main.js"))
  .pipe(uglify())
  .pipe(gulp.dest("dist/js"));
});

// Minimize images task
gulp.task("images", function() {
  return gulp.src("src/images/**")
  .pipe(imagemin())
  .pipe(gulp.dest("dist/images"))
});

// Watch task
gulp.task("watch", function() {
  gulp.watch("src/js/*.js", ["scripts"]);
  gulp.watch("src/scss/**/*.scss", ["sass"]);
  gulp.watch("src/images/**", ["images"]);
});

gulp.task("default", ["scripts", "sass", "images"]);
