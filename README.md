# OpenSearch for Nix

This repository contains the Nix packages for the OpenSearch.

## Usage in Devenv

### devenv.yaml

```diff
inputs:
  nixpkgs:
    url: github:NixOS/nixpkgs/nixpkgs-unstable
+  opensearch:
+    url: github:shyim/opensearch-nix
+    inputs:
+      nixpkgs:
+        follows: nixpkgs
```

### devenv.nix

```diff
-{ pkgs, lib, config, ... }:
+{ pkgs, lib, config, inputs, ... }:

{
+  services.elasticsearch.package = inputs.opensearch.packages.${builtins.currentSystem}.opensearch;
}
```