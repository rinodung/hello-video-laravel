var gulp = require('gulp');
var less = require('gulp-less');
var path = require('path');
var watch = require('gulp-watch');

gulp.task('default', function () {
	watch('./less/**/*.less', function () {
        gulp.src('./less/**/*.less')
            .pipe(less({
		      paths: [ path.join(__dirname, 'less', 'includes') ]
		    }))
		    .pipe(gulp.dest('./css'));
    });

  
});