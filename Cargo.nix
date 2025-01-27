# This file was @generated by cargo2nix 0.11.0.
# It is not intended to be manually edited.

args@{
  release ? true,
  rootFeatures ? [
    "verso/default"
  ],
  rustPackages,
  buildRustPackages,
  hostPlatform,
  hostPlatformCpu ? null,
  hostPlatformFeatures ? [],
  target ? null,
  codegenOpts ? null,
  profileOpts ? null,
  cargoUnstableFlags ? null,
  rustcLinkFlags ? null,
  rustcBuildFlags ? null,
  mkRustCrate,
  rustLib,
  lib,
  workspaceSrc,
  ignoreLockHash,
}:
let
  nixifiedLockHash = "c01f7683b64f65306b96e6fc37b7441def2912fbfbbbaaa59e9bc500927bb15b";
  workspaceSrc = if args.workspaceSrc == null then ./. else args.workspaceSrc;
  currentLockHash = builtins.hashFile "sha256" (workspaceSrc + /Cargo.lock);
  lockHashIgnored = if ignoreLockHash
                  then builtins.trace "Ignoring lock hash" ignoreLockHash
                  else ignoreLockHash;
in if !lockHashIgnored && (nixifiedLockHash != currentLockHash) then
  throw ("Cargo.nix ${nixifiedLockHash} is out of sync with Cargo.lock ${currentLockHash}")
else let
  inherit (rustLib) fetchCratesIo fetchCrateLocal fetchCrateGit fetchCrateAlternativeRegistry expandFeatures decideProfile genDrvsByProfile;
  profilesByName = {
  };
  rootFeatures' = expandFeatures rootFeatures;
  overridableMkRustCrate = f:
    let
      drvs = genDrvsByProfile profilesByName ({ profile, profileName }: mkRustCrate ({ inherit release profile hostPlatformCpu hostPlatformFeatures target profileOpts codegenOpts cargoUnstableFlags rustcLinkFlags rustcBuildFlags; } // (f profileName)));
    in { compileMode ? null, profileName ? decideProfile compileMode release }:
      let drv = drvs.${profileName}; in if compileMode == null then drv else drv.override { inherit compileMode; };
in
{
  cargo2nixVersion = "0.11.0";
  workspace = {
    verso = rustPackages.unknown.verso."0.2.0";
  };
  "registry+https://github.com/rust-lang/crates.io-index".aho-corasick."1.1.2" = overridableMkRustCrate (profileName: rec {
    name = "aho-corasick";
    version = "1.1.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "b2969dcb958b36655471fc61f7e416fa76033bdd4bfed0678d8fee1e2d07a1f0"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "perf-literal" ]
      [ "std" ]
    ];
    dependencies = {
      memchr = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".memchr."2.6.4" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".itoa."1.0.9" = overridableMkRustCrate (profileName: rec {
    name = "itoa";
    version = "1.0.9";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "af150ab688ff2122fcef229be89cb50dd66af9e01a4ff320cc137eecc9bacc38"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".memchr."2.6.4" = overridableMkRustCrate (profileName: rec {
    name = "memchr";
    version = "2.6.4";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "f665ee40bc4a3c5590afb1e9677db74a508659dfd71e126420da8274909a0167"; };
    features = builtins.concatLists [
      [ "alloc" ]
      [ "default" ]
      [ "std" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.69" = overridableMkRustCrate (profileName: rec {
    name = "proc-macro2";
    version = "1.0.69";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "134c189feb4956b20f6f547d2cf727d4c0fe06722b20a0eec87ed445a97f92da"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "proc-macro" ]
    ];
    dependencies = {
      unicode_ident = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.12" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".quote."1.0.33" = overridableMkRustCrate (profileName: rec {
    name = "quote";
    version = "1.0.33";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "proc-macro" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.69" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".regex."1.10.2" = overridableMkRustCrate (profileName: rec {
    name = "regex";
    version = "1.10.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "380b951a9c5e80ddfd6136919eef32310721aa4aacd4889a8d39124b026ab343"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "perf" ]
      [ "perf-backtrack" ]
      [ "perf-cache" ]
      [ "perf-dfa" ]
      [ "perf-inline" ]
      [ "perf-literal" ]
      [ "perf-onepass" ]
      [ "std" ]
      [ "unicode" ]
      [ "unicode-age" ]
      [ "unicode-bool" ]
      [ "unicode-case" ]
      [ "unicode-gencat" ]
      [ "unicode-perl" ]
      [ "unicode-script" ]
      [ "unicode-segment" ]
    ];
    dependencies = {
      aho_corasick = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".aho-corasick."1.1.2" { inherit profileName; }).out;
      memchr = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".memchr."2.6.4" { inherit profileName; }).out;
      regex_automata = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".regex-automata."0.4.3" { inherit profileName; }).out;
      regex_syntax = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".regex-syntax."0.8.2" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".regex-automata."0.4.3" = overridableMkRustCrate (profileName: rec {
    name = "regex-automata";
    version = "0.4.3";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "5f804c7828047e88b2d32e2d7fe5a105da8ee3264f01902f796c8e067dc2483f"; };
    features = builtins.concatLists [
      [ "alloc" ]
      [ "dfa-onepass" ]
      [ "hybrid" ]
      [ "meta" ]
      [ "nfa-backtrack" ]
      [ "nfa-pikevm" ]
      [ "nfa-thompson" ]
      [ "perf-inline" ]
      [ "perf-literal" ]
      [ "perf-literal-multisubstring" ]
      [ "perf-literal-substring" ]
      [ "std" ]
      [ "syntax" ]
      [ "unicode" ]
      [ "unicode-age" ]
      [ "unicode-bool" ]
      [ "unicode-case" ]
      [ "unicode-gencat" ]
      [ "unicode-perl" ]
      [ "unicode-script" ]
      [ "unicode-segment" ]
      [ "unicode-word-boundary" ]
    ];
    dependencies = {
      aho_corasick = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".aho-corasick."1.1.2" { inherit profileName; }).out;
      memchr = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".memchr."2.6.4" { inherit profileName; }).out;
      regex_syntax = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".regex-syntax."0.8.2" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".regex-syntax."0.8.2" = overridableMkRustCrate (profileName: rec {
    name = "regex-syntax";
    version = "0.8.2";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "c08c74e62047bb2de4ff487b251e4a92e24f48745648451635cec7d591162d9f"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
      [ "unicode" ]
      [ "unicode-age" ]
      [ "unicode-bool" ]
      [ "unicode-case" ]
      [ "unicode-gencat" ]
      [ "unicode-perl" ]
      [ "unicode-script" ]
      [ "unicode-segment" ]
    ];
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".ryu."1.0.15" = overridableMkRustCrate (profileName: rec {
    name = "ryu";
    version = "1.0.15";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "1ad4cc8da4ef723ed60bced201181d83791ad433213d8c24efffda1eec85d741"; };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".serde."1.0.192" = overridableMkRustCrate (profileName: rec {
    name = "serde";
    version = "1.0.192";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "bca2a08484b285dcb282d0f67b26cadc0df8b19f8c12502c13d966bf9482f001"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "derive" ]
      [ "serde_derive" ]
      [ "std" ]
    ];
    dependencies = {
      serde_derive = (buildRustPackages."registry+https://github.com/rust-lang/crates.io-index".serde_derive."1.0.192" { profileName = "__noProfile"; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".serde_derive."1.0.192" = overridableMkRustCrate (profileName: rec {
    name = "serde_derive";
    version = "1.0.192";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "d6c7207fbec9faa48073f3e3074cbe553af6ea512d7c21ba46e434e70ea9fbc1"; };
    features = builtins.concatLists [
      [ "default" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.69" { inherit profileName; }).out;
      quote = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.33" { inherit profileName; }).out;
      syn = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".syn."2.0.39" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".serde_json."1.0.108" = overridableMkRustCrate (profileName: rec {
    name = "serde_json";
    version = "1.0.108";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3d1c7e3eac408d115102c4c24ad393e0821bb3a5df4d506a80f85f7a742a526b"; };
    features = builtins.concatLists [
      [ "default" ]
      [ "std" ]
    ];
    dependencies = {
      itoa = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".itoa."1.0.9" { inherit profileName; }).out;
      ryu = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".ryu."1.0.15" { inherit profileName; }).out;
      serde = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.192" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".syn."2.0.39" = overridableMkRustCrate (profileName: rec {
    name = "syn";
    version = "2.0.39";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a"; };
    features = builtins.concatLists [
      [ "clone-impls" ]
      [ "default" ]
      [ "derive" ]
      [ "parsing" ]
      [ "printing" ]
      [ "proc-macro" ]
      [ "quote" ]
    ];
    dependencies = {
      proc_macro2 = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".proc-macro2."1.0.69" { inherit profileName; }).out;
      quote = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".quote."1.0.33" { inherit profileName; }).out;
      unicode_ident = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.12" { inherit profileName; }).out;
    };
  });
  
  "registry+https://github.com/rust-lang/crates.io-index".unicode-ident."1.0.12" = overridableMkRustCrate (profileName: rec {
    name = "unicode-ident";
    version = "1.0.12";
    registry = "registry+https://github.com/rust-lang/crates.io-index";
    src = fetchCratesIo { inherit name version; sha256 = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"; };
  });
  
  "unknown".verso."0.2.0" = overridableMkRustCrate (profileName: rec {
    name = "verso";
    version = "0.2.0";
    registry = "unknown";
    src = fetchCrateLocal workspaceSrc;
    dependencies = {
      regex = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".regex."1.10.2" { inherit profileName; }).out;
      serde = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde."1.0.192" { inherit profileName; }).out;
      serde_json = (rustPackages."registry+https://github.com/rust-lang/crates.io-index".serde_json."1.0.108" { inherit profileName; }).out;
    };
  });
  
}
