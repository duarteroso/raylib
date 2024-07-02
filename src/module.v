module raylib

import semver

pub fn version() semver.Version {
	return semver.build(5, 0, 0)
}
