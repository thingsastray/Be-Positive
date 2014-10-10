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
  src : String->Dynamic
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

  private static var gulp:Gulp = Node.require("gulp");
  private static var connect:GulpConnect = Node.require("gulp-connect");
  
  public static function main()
  {
    gulp.task('default', ['connect','watch']);
    gulp.task('watch',  watch_task);
    gulp.task('connect', connect_task);
  }


  private static inline function connect_task(cb:Void->Void):Void
  {
    connect.server({
      root: WEBROOT,
      livereload: true
    });
  }

  private static inline function watch_task(?cb:Void->Void):Void
  {
    gulp.watch(['$WEBROOT/**'], reload);
  }

  private static inline function reload(event:GulpEvent):Void
  {
    trace("Reloading...");
    gulp.src('$WEBROOT/**')
      .pipe(connect.reload());
  }
  
}