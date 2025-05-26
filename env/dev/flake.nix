{
inputs.nixpkgs.url = github:NixOS/nixpkgs/25.05;
inputs.app-b.url = ../../app_b;
outputs =
    { self, nixpkgs, app-b }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;
      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = [ app-b.packages.${system}.default ];
    };
  };
}
