{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nix-update-script,
}:

buildGoModule (finalAttrs: {
  pname = "tock";
  version = "2.0.4";
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "kriuchkov";
    repo = "tock";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8mG25DocVz2cSz2LF2uHPwApCv4KKAYiCm2WGId/zeM=";
  };

  vendorHash = "sha256-j8npmhZX2hcZYrtDtJWxUXzrBtf5hPOHkInRfuWVb40=";

  ldflags = [
    "-s"
    "-w"
    "-X=github.com/kriuchkov/tock/internal/app/commands.version=${finalAttrs.version}"
    "-X=github.com/kriuchkov/tock/internal/app/commands.commit=${finalAttrs.src.rev}"
    "-X=github.com/kriuchkov/tock/internal/app/commands.date=1970-01-01T00:00:00Z"
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Tock is a powerful time tracking tool for the command line. It saves activity logs as plaintext files and provides an interactive terminal UI for viewing your time";
    homepage = "https://github.com/kriuchkov/tock";
    changelog = "https://github.com/kriuchkov/tock/releases/tag/${finalAttrs.src.tag}";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ ricardomaps ];
    mainProgram = "tock";
  };
})
