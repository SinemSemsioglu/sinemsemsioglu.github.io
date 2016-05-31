var gulp = require("gulp"),
    browserSync = require("browser-sync").create(),
    path = require("path"),
    less = require("gulp-less"),
    webserver = require("gulp-webserver"),
    concat = require("gulp-concat");

gulp.task("default", ["watch"]);

var libPathList = [
    "bower_components/angular/angular.min.js",
    "bower_components/angular-ui-router/release/angular-ui-router.min.js"
];

var sourcePathList = ["src/app.js", "src/modules/**/**.js"];

var cssPathList = ["src/modules/**/**.less"];

var templatePathList = ["src/modules/**/**.html"];

gulp.task("browser-sync", function () {
    browserSync.init({
        "server": {
            "baseDir": "",
            "index": "/index.html"
        }
    });

});

gulp.task("less", function () {
    return gulp.src(cssPathList)
        .pipe(less({
            "paths": [path.join(__dirname, "less", "includes")]
        }))
        .pipe(concat("app.css"))
        .pipe(gulp.dest(""));
});

gulp.task("webserver", function () {
    gulp.src("dist")
        .pipe(webserver({
            host: "0.0.0.0",
            port: process.env.PORT,
            //port: "3000",
            livereload: true,
            open: true
        }));
});

gulp.task("scripts", function () {
    return gulp.src(libPathList.concat(sourcePathList))
        .pipe(concat("personal.js"))
        .pipe(gulp.dest(""));
});

gulp.task("copyAssets", function () {
    return gulp.src("assets/**")
        .pipe(gulp.dest("dist/assets/"));
});

gulp.task("copyTemplates", function () {
    return gulp.src(templatePathList)
        .pipe(gulp.dest("templates/"));
});

gulp.task("copyIndex", function () {
    return gulp.src("src/index.html")
        .pipe(gulp.dest(""));
});


gulp.task("build-dev", ["less", "copyTemplates", "scripts", "copyIndex"]);


gulp.task("watch", function () {
    gulp.watch(cssPathList, ["less"]);
    gulp.watch(sourcePathList, ["scripts"]);
    gulp.watch(templatePathList, ["copyTemplates"]);
    gulp.watch("src/index.html", ["copyIndex"]);
});

gulp.task("dev-live", ["build-dev", "browser-sync", "watch"]);
