{
inputs.nixpkgs.url = github:NixOS/nixpkgs/25.05;
inputs.app-a.url = ../app_a;
outputs =
    { self, nixpkgs, app-a }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      app_a = app-a.packages.${system}.default;
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      packages.${system}.default = pkgs.writeShellScriptBin "app-b" ''
        echo app-b
        ${app_a}/bin/app-a
      '';
    };

}
