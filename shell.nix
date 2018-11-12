with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "angular-development";
    buildInputs = [
        nodejs-10_x
        nodePackages.npm
        nodePackages.yarn
        nodePackages.jsonlint
        bashInteractive
        travis
    ];
    shellHook = ''
        # make sure no output is done, since direnv fails with direnv: error unmarshal() base64 decoding: illegal base64 data at input byte ?
        yarn install @angular/cli > /dev/null 2>&1
        # put all linked executables in node_modules on the path
        export PATH=`pwd`/node_modules/.bin:$PATH
    '';
}
