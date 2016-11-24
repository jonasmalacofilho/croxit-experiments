package build;
import Sys.*;
import haxe.io.Path;
import sys.FileSystem;
import build.templates.android.AndroidProject;
using StringTools;

enum Platform {
	Windows;
	Nix;
}

class PostBuild {
	static var JAR_PATH = Path.normalize("temp/java.jar");
	static var MANIFEST_PATH = Path.normalize("temp/AndroidManifest.xml");
	static var MAIN_GRADLE = Path.normalize("temp/build.gradle");
	static var APP_GRADLE = Path.normalize("temp/app_build.gradle");
	static var SETTINGS_GRADLE = Path.normalize("temp/settings.gradle");

	static var EXPORT_PATH = Path.normalize("Java/");

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

	static function clean()
	{
		FileSystem.deleteDirectory("temp");
	}

	static function main()
	{
		Sys.println("Running post-build tasks");
		Sys.println('Platform is $platform');
		copy(JAR_PATH, Path.join([EXPORT_PATH,"app","libs", "haxe.jar"]));
		copy(MANIFEST_PATH, Path.join([EXPORT_PATH, "app","src","main", "AndroidManifest.xml"]));
		copy(MAIN_GRADLE, Path.join([EXPORT_PATH, "build.gradle"]));
		copy(APP_GRADLE, Path.join([EXPORT_PATH,"app", "build.gradle"]));
		copy(SETTINGS_GRADLE, Path.join([EXPORT_PATH, "settings.gradle"]));
		
		Sys.println("Post-build tasks completed successfully");
	}
}

