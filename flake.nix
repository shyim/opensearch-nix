{
  description = "Packages for OpenSearch";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      formatter = forAllSystems (
        system:
        nixpkgs.legacyPackages.${system}.nixpkgs-fmt
      );

      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          opensearch_2_5_0 = pkgs.callPackage ./packages/2.5.0 { };
          opensearch_2_6_0 = pkgs.callPackage ./packages/2.6.0 { };
          opensearch = pkgs.callPackage ./packages/2.6.0 { };
        }
      );
    };
}