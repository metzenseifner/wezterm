{
  description = "WezTerm configuration flake for NixOS integration";

  outputs = { self, ... }: {
    # Expose your WezTerm configuration files for declarative use
    # and architecture-agnostic referencing from your main NixOS flake.

    files = {
      "wezterm.lua" = ./wezterm.lua;
      "fonts/" = ./fonts;
      "colors/" = ./colors;
      "scripts/" = ./scripts;
    };

    # Optionally expose as a package for retrieval if needed:
    packages = {
      default = self.files;
    };
  };
}
