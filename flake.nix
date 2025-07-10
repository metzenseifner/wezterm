{
description="WezTerm configuration flake";
  outputs = {self,...}: {
    packages = rec {
      default = self;
    };
  };
}