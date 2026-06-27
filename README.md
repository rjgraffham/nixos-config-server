# NixOS config


This is my NixOS config, plus some tooling for managing its inputs without
flakes.

> [!NOTE]
> This branch is relatively inactive - there is work ongoing in the
> [`containers`][containers] and [`kubernetes`][kubernetes] branches:
> 
> The `containers` branch is actively being worked on, and contains
> the quadlet definitions for my currently active container deployments
> of service using SystemD (still on the NixOS host).
> with deploying services as containers
> 
> Further work is also planned in the `kubernetes` branch, with a goal
> of translating the already proven container-based setup into a single-node
> kubernetes deployment, which would initially be deployed on k3s on
> NixOS, but would then be relatively straightforward to transplant onto
> any kubernetes host (currently looking at Talos).
> 
> The goal here is to get ease of automatically updating containerized
> deployments from a git source of truth in the short term, and to
> provide a stepping stone to going multi-node in the longer term if
> and when I have multiple reasonably power-efficient machines in
> my homelab.


## Structure of this repo


### `hosts`

Definitions for hosts are found in `hosts/default.nix`, with a few fields:

- `system`: _(required)_ The system (e.g., x86\_64-linux, aarch64-darwin, ...)
  the host runs on.

- `config`: _(required)_ The base module of the host's configuration. By
  convention, this is typically `hosts/HOSTNAME/default.nix`, but it doesn't
  have to be.

- `nixpkgs`: _(required)_ A nixpkgs source that the host's config will be built
  against. This uses `sources` (see below) to get the path to a nixpkgs source
  tree, and then the build will combine this with the host's `system` and
  `overlays` to instantiate the nixpkgs used to go on and build the system.

- `overlays`: _(optional)_ A list of overlays to apply to nixpkgs when building
  this host.


### `overlays`

Overlays to be applied to nixpkgs. One overlay per nix file, defined directly
at the top level of that file.


### `nix`

Configuration for Nix itself. At time of writing, it configures automatic
garbage collection and trusted users for substituters, and enables flake
support in Nix tooling, including creating entries in the flake registry
for the nixpkgs inputs used to build the system.


### `programs`

Configuration for programs that need more than simply having their packages
added to the user environment:

- `neovim`

- `starship`

- `tmux`


### `services`

Configuration for services:

- [Tailscale][tailscale]


### `users`

Configuration for users:

- `rj`


### `sources.json` and `sources.nix`

Sources for the inputs used to build configurations. The tooling updates data
in the JSON file, and `sources.nix` imports that data and uses
`builtins.fetchTree` to retrieve the referenced sources.


### `sources.sh`

Simple shell script to manage `sources.json`. Currently only supports git
sources, though I do want to expand it to support `builtins.fetchTree`'s other
source types eventually.


### `build.sh` and `build.nix`

Shell script and nix file that wrap `switch-to-configuration`, providing a less
featureful but lighter alternative to `nixos-rebuild`. They build and optionally
activate the configuration defined in `hosts` for a given hostname (by default,
the current hostname of the system they're running on).



[tailscale]: https://tailscale.com/
[containers]: https://github.com/rjgraffham/nixos-config-server/tree/containers
[kubernetes]: https://github.com/rjgraffham/nixos-config-server/tree/kubernetes
