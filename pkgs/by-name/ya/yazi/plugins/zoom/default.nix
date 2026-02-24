{
  lib,
  fetchFromGitHub,
  mkYaziPlugin,
}:
mkYaziPlugin {
  pname = "zoom.yazi";
  version = "26.1.22-unstable-2026-02-24";

  src = fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "6047ce43f3b8a5aa39963dfd182bcee6f210bd2d";
    hash = lib.fakeHash;
  };

  meta = {
    description = "Enlarge or shrink the preview image of a file, which is useful for magnifying small files for viewing";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.ricardomaps ];
  };
}
