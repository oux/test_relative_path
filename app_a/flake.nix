{
inputs.nixpkgs.url = github:NixOS/nixpkgs/25.05;
outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      packages.${system}.default = pkgs.writeShellScriptBin "app-a" ''
        echo app-a
      '';
    };

}
