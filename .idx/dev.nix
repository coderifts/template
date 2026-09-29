# Workspace environment. Channel and nodejs_20 follow
# https://firebase.google.com/docs/studio/customize-workspace
# coderifts is installed from npm: no nixpkgs attribute was measured here.
{ pkgs, ... }: {
  channel = "stable-24.11";
  packages = [
    pkgs.nodejs_20
  ];
  idx = {
    workspace = {
      onCreate = {
        default.openFiles = [
          "README.md"
          "openapi.yaml"
          ".coderifts.yml"
        ];
        installDependencies = "npm install --global coderifts@8.6.8";
      };
    };
    # Previews are enabled. This template has no HTTP server, so there is no web command.
    previews = {
      enable = true;
    };
  };
}
