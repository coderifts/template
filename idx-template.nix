# No user-configurable parameters.
# Bootstrap matches the Firebase Studio custom-template example:
# https://firebase.google.com/docs/studio/custom-templates
{ pkgs, ... }: {
  bootstrap = ''
    cp -rf ${./.} "$out"
    chmod -R +w "$out"
    rm -rf "$out/.git" "$out/idx-template".{nix,json}
  '';
}
