module raylib

import semver

pub fn version() semver.Version {
	return semver.build(raylib_version_major, raylib_version_minor, raylib_version_patch)
}
