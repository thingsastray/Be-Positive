/*
  Gulp task

  this is used to create the gulpfile.js

  tasks:
    - default : runs http server with live reload
    - test : todo
*/
import js.Node;

typedef Gulp = {
  task : String->Dynamic->Void,
  watch : Array<String>->(GulpEvent->Void)->Void,
  src : Dynamic->Dynamic,
  dest : String->Dynamic
}

typedef GulpEvent = {
  type : String,
  path : String
}

typedef GulpConnect = {
  server : Dynamic->Void,
  reload : Void->Void
}

class Gulpfile
{
  public static inline var WEBROOT:String = "./bin/html5";
  public static inline var RELEASE_WEBROOT:String = "./";
  public static inline var RELEASE_BUILD_TASK:String = "./Be-Positive";

  private static var gulp:Gulp = Node.require("gulp");
  private static var connect:GulpConnect = Node.require("gulp-connect");
  private static var uglify:Dynamic->Void = Node.require("gulp-uglify");

  public static function main()
  {
    gulp.task('default', ['connect','watch']);
    gulp.task('watch',  watch_task);
    gulp.task('connect', connect_task);
    gulp.task('release', release_task);
  }

  private static inline function release_task(cb:Void->Void):Void
  {
    // copy release files
    gulp.src('${WEBROOT}/bin/lib/*')
      .pipe(gulp.dest('${RELEASE_BUILD_TASK}/js/lib/'));
    gulp.src('${WEBROOT}/Be-Positive.js')
      .pipe(gulp.dest('${RELEASE_BUILD_TASK}/js/'));
    gulp.src(['${WEBROOT}/index.html','${WEBROOT}/bin/{font,graphics}/**/*'])
      .pipe(gulp.dest('${RELEASE_BUILD_TASK}/'));

    gulp.src('${WEBROOT}/bin/Main.js')
      .pipe(uglify({
        mangle : false
      }))
      .pipe(gulp.dest('${RELEASE_BUILD_TASK}/js/lib/'));
  }

  private static inline function connect_task(cb:Void->Void):Void
  {
    connect.server({
      root: RELEASE_WEBROOT,
      livereload: true
    });
  }

  private static inline function watch_task(?cb:Void->Void):Void
  {
    gulp.watch(['${RELEASE_WEBROOT}/js/*.js'], reload);
  }

  private static inline function reload(event:GulpEvent):Void
  {
    trace('Reloading... ${event.path}');

    haxe.Timer.delay(function()
      {
        gulp.src(event.path)
          .pipe(connect.reload());
        trace("Reloaded");
      },
      if( StringTools.endsWith(event.path, "Be-Positive.js")){
        0;
      }else{
        3000;
      }
    );
  }

}
