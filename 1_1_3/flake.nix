{
  description = ''ISO codes for Nim.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-isocodes-1_1_3.flake = false;
  inputs.src-isocodes-1_1_3.owner = "kraptor";
  inputs.src-isocodes-1_1_3.ref   = "refs/tags/1.1.3";
  inputs.src-isocodes-1_1_3.repo  = "isocodes";
  inputs.src-isocodes-1_1_3.type  = "github";
  
  inputs."jsony".dir   = "nimpkgs/j/jsony";
  inputs."jsony".owner = "riinr";
  inputs."jsony".ref   = "flake-pinning";
  inputs."jsony".repo  = "flake-nimble";
  inputs."jsony".type  = "github";
  inputs."jsony".inputs.nixpkgs.follows = "nixpkgs";
  inputs."jsony".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-isocodes-1_1_3"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-isocodes-1_1_3";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}