import Sys.*;
import haxe.io.Path;
import sys.FileSystem;

enum Platform {
	Windows;
	Nix;
}

class PostBuild {
	static inline var JAR_PATH = "java/java.jar";
	static inline var EXPORT_PATH = "../Java/app/libs";

	static var platform = switch Sys.systemName().toLowerCase() {
		case "windows": Windows;
		case _: Nix;
		}

	static function copy(src, dest)
	{
		var destDir = Path.directory(dest);
		Sys.println(' => Copying $src to $dest (will create $destDir directory if necessary)');
		FileSystem.createDirectory(destDir);
		var exit = switch platform {
		case Windows:
			Sys.command("copy", ["/y", "/b", src, dest]);
		case Nix:
			Sys.command("cp", [src, dest]);
		}
		if (exit != 0) throw "Copy failed";
	}

	static function main()
	{
		Sys.println("Running post-build tasks");
		copy(JAR_PATH, Path.join([EXPORT_PATH, "haxe.jar"]));
		Sys.println("Post-build tasks completed successfully");
	}
}

