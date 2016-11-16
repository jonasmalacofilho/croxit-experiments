package build;
import Sys.*;
import haxe.io.Path;
import sys.FileSystem;

using StringTools;

enum Platform {
	Windows;
	Nix;
}

class PostBuild {
	static var JAR_PATH = Path.normalize("java/java.jar");
	static var EXPORT_PATH = Path.normalize("../Java/app/libs");

	static var platform = switch Sys.systemName().toLowerCase() {
		case "windows": Windows;
		case _: Nix;
		}

	static function copy(src, dest)
	{
		var destDir = Path.directory(dest);
		Sys.println(' => Copying $src to $dest (will create $destDir directory if necessary)');
		var exit = switch platform {
		case Windows:
			src = src.replace("/", "\\");
			dest = dest.replace("/", "\\");
			destDir = destDir.replace("/", "\\");
			FileSystem.createDirectory(destDir);
			Sys.command("copy", ["/y", "/b", src, dest]);
		case Nix:
			FileSystem.createDirectory(destDir);
			Sys.command("cp", [src, dest]);
		}
		if (exit != 0) throw "Copy failed";
	}

	static function main()
	{
		Sys.println("Running post-build tasks");
		Sys.println('Platform is $platform');
		copy(JAR_PATH, Path.join([EXPORT_PATH, "haxe.jar"]));
		Sys.println("Post-build tasks completed successfully");
	}
}

