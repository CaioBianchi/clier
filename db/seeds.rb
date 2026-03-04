Tool.destroy_all

tools = [
  {
    name: "Neovim",
    description: "Vim-fork focused on extensibility and usability",
    category: "Editor",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/neovim/neovim",
    github_url: "https://github.com/neovim/neovim",
    image_url: nil
  },
  {
    name: "fzf",
    description: "A command-line fuzzy finder",
    category: "TUI / Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/junegunn/fzf",
    github_url: "https://github.com/junegunn/fzf",
    image_url: nil
  },
  {
    name: "ripgrep",
    description: "recursively searches directories for a regex pattern",
    category: "Search Tool",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/BurntSushi/ripgrep",
    github_url: "https://github.com/BurntSushi/ripgrep",
    image_url: nil
  },
  {
    name: "lazygit",
    description: "Simple terminal UI for git commands",
    category: "TUI / Git",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/jesseduffield/lazygit",
    github_url: "https://github.com/jesseduffield/lazygit",
    image_url: nil
  },
  {
    name: "bat",
    description: "A cat(1) clone with wings.",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/sharkdp/bat",
    github_url: "https://github.com/sharkdp/bat",
    image_url: nil
  },
  {
    name: "tmux",
    description: "tmux is a terminal multiplexer",
    category: "Terminal Multiplexer",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/tmux/tmux",
    github_url: "https://github.com/tmux/tmux",
    image_url: nil
  },
  {
    name: "jq",
    description: "Command-line JSON processor",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/jqlang/jq",
    github_url: "https://github.com/jqlang/jq",
    image_url: nil
  },
  {
    name: "htop",
    description: "An interactive process viewer",
    category: "TUI / System",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/htop-dev/htop",
    github_url: "https://github.com/htop-dev/htop",
    image_url: nil
  },
  {
    name: "eza",
    description: "A modern, maintained replacement for ls",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/eza-community/eza",
    github_url: "https://github.com/eza-community/eza",
    image_url: nil
  },
  {
    name: "zoxide",
    description: "A smarter cd command. Supports all major shells.",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/ajeetdsouza/zoxide",
    github_url: "https://github.com/ajeetdsouza/zoxide",
    image_url: nil
  },
  {
    name: "starship",
    description: "The minimal, blazing-fast, and infinitely customizable prompt for any shell!",
    category: "Prompt",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/starship/starship",
    github_url: "https://github.com/starship/starship",
    image_url: nil
  },
  {
    name: "fd",
    description: "A simple, fast and user-friendly alternative to 'find'",
    category: "Search Tool",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/sharkdp/fd",
    github_url: "https://github.com/sharkdp/fd",
    image_url: nil
  },
  {
    name: "delta",
    description: "A viewer for git and diff output",
    category: "Git / Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/dandavison/delta",
    github_url: "https://github.com/dandavison/delta",
    image_url: nil
  },
  {
    name: "zellij",
    description: "A terminal workspace with batteries included",
    category: "Terminal Multiplexer",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/zellij-org/zellij",
    github_url: "https://github.com/zellij-org/zellij",
    image_url: nil
  },
  {
    name: "k9s",
    description: "Kubernetes CLI To Manage Your Clusters In Style",
    category: "TUI / Kubernetes",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/derailed/k9s",
    github_url: "https://github.com/derailed/k9s",
    image_url: nil
  },
  {
    name: "bottom",
    description: "Yet another cross-platform graphical process/system monitor.",
    category: "TUI / System",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/ClementTsang/bottom",
    github_url: "https://github.com/ClementTsang/bottom",
    image_url: nil
  },
  {
    name: "dust",
    description: "A more intuitive version of du in rust",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/bootandy/dust",
    github_url: "https://github.com/bootandy/dust",
    image_url: nil
  },
  {
    name: "duf",
    description: "Disk Usage/Free Utility - a better 'df' alternative",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/muesli/duf",
    github_url: "https://github.com/muesli/duf",
    image_url: nil
  },
  {
    name: "broot",
    description: "A new way to see and navigate directory trees",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/Canop/broot",
    github_url: "https://github.com/Canop/broot",
    image_url: nil
  },
  {
    name: "yq",
    description: "jq wrapper for YAML, XML, TOML documents",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/mikefarah/yq",
    github_url: "https://github.com/mikefarah/yq",
    image_url: nil
  },
  {
    name: "httpie",
    description: "As easy as /aitch-tee-tee-pie/ Modern, user-friendly command-line HTTP client",
    category: "Network",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/httpie/httpie",
    github_url: "https://github.com/httpie/httpie",
    image_url: nil
  },
  {
    name: "curlie",
    description: "The power of curl, the ease of use of httpie",
    category: "Network",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/rs/curlie",
    github_url: "https://github.com/rs/curlie",
    image_url: nil
  },
  {
    name: "gh",
    description: "GitHub's official command line tool",
    category: "Git / Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/cli/cli",
    github_url: "https://github.com/cli/cli",
    image_url: nil
  },
  {
    name: "glow",
    description: "Render markdown on the CLI, with pizzazz!",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/charmbracelet/glow",
    github_url: "https://github.com/charmbracelet/glow",
    image_url: nil
  },
  {
    name: "gum",
    description: "A tool for glamorous shell scripts",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/charmbracelet/gum",
    github_url: "https://github.com/charmbracelet/gum",
    image_url: nil
  },
  {
    name: "vhs",
    description: "Your CLI home video recorder",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/charmbracelet/vhs",
    github_url: "https://github.com/charmbracelet/vhs",
    image_url: nil
  },
  {
    name: "navi",
    description: "An interactive cheatsheet tool for the command-line",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/denisidoro/navi",
    github_url: "https://github.com/denisidoro/navi",
    image_url: nil
  },
  {
    name: "tealdeer",
    description: "A very fast implementation of tldr in Rust",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/tealdeer-rs/tealdeer",
    github_url: "https://github.com/tealdeer-rs/tealdeer",
    image_url: nil
  },
  {
    name: "procs",
    description: "A modern replacement for ps written in Rust",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/dalance/procs",
    github_url: "https://github.com/dalance/procs",
    image_url: nil
  },
  {
    name: "sd",
    description: "Intuitive find & replace CLI (sed alternative)",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/chmln/sd",
    github_url: "https://github.com/chmln/sd",
    image_url: nil
  },
  {
    name: "grex",
    description: "A command-line tool and library for generating regular expressions from user-provided test cases",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/pemistahl/grex",
    github_url: "https://github.com/pemistahl/grex",
    image_url: nil
  },
  {
    name: "hyperfine",
    description: "A command-line benchmarking tool",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/sharkdp/hyperfine",
    github_url: "https://github.com/sharkdp/hyperfine",
    image_url: nil
  },
  {
    name: "mcfly",
    description: "Fly through your shell history. Great Scott!",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/cantino/mcfly",
    github_url: "https://github.com/cantino/mcfly",
    image_url: nil
  },
  {
    name: "choose",
    description: "A human-friendly and fast alternative to cut and (sometimes) awk",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/theryangeary/choose",
    github_url: "https://github.com/theryangeary/choose",
    image_url: nil
  },
  {
    name: "tokei",
    description: "Count your code, quickly.",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/XAMPPRocky/tokei",
    github_url: "https://github.com/XAMPPRocky/tokei",
    image_url: nil
  },
  {
    name: "dog",
    description: "A command-line DNS client",
    category: "Network",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/ogham/dog",
    github_url: "https://github.com/ogham/dog",
    image_url: nil
  },
  {
    name: "gping",
    description: "Ping, but with a graph",
    category: "Network",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/orf/gping",
    github_url: "https://github.com/orf/gping",
    image_url: nil
  },
  {
    name: "xh",
    description: "Friendly and fast tool for sending HTTP requests",
    category: "Network",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/ducaale/xh",
    github_url: "https://github.com/ducaale/xh",
    image_url: nil
  },
  {
    name: "bandwhich",
    description: "Terminal bandwidth utilization tool",
    category: "Network",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/imsnif/bandwhich",
    github_url: "https://github.com/imsnif/bandwhich",
    image_url: nil
  },
  {
    name: "trippy",
    description: "A network diagnostic tool",
    category: "Network",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/fujiapple852/trippy",
    github_url: "https://github.com/fujiapple852/trippy",
    image_url: nil
  },
  {
    name: "dua",
    description: "View disk space usage and delete unwanted data, fast.",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/Byron/dua-cli",
    github_url: "https://github.com/Byron/dua-cli",
    image_url: nil
  },
  {
    name: "diskus",
    description: "A minimal, fast alternative to 'du -sh'",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/sharkdp/diskus",
    github_url: "https://github.com/sharkdp/diskus",
    image_url: nil
  },
  {
    name: "watchexec",
    description: "Executes commands in response to file modifications",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/watchexec/watchexec",
    github_url: "https://github.com/watchexec/watchexec",
    image_url: nil
  },
  {
    name: "entr",
    description: "Run arbitrary commands when files change",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/eradman/entr",
    github_url: "https://github.com/eradman/entr",
    image_url: nil
  },
  {
    name: "just",
    description: "Just a command runner",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/casey/just",
    github_url: "https://github.com/casey/just",
    image_url: nil
  },
  {
    name: "macchina",
    description: "A system information fetcher, with an emphasis on performance and minimalism.",
    category: "System Info",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/Macchina-CLI/macchina",
    github_url: "https://github.com/Macchina-CLI/macchina",
    image_url: nil
  },
  {
    name: "neofetch",
    description: "A command-line system information tool written in bash 3.2+",
    category: "System Info",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/dylanaraps/neofetch",
    github_url: "https://github.com/dylanaraps/neofetch",
    image_url: nil
  },
  {
    name: "fastfetch",
    description: "Like neofetch, but much faster because written in c.",
    category: "System Info",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/fastfetch-cli/fastfetch",
    github_url: "https://github.com/fastfetch-cli/fastfetch",
    image_url: nil
  },
  {
    name: "onefetch",
    description: "Command-line Git information tool",
    category: "System Info",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/o2sh/onefetch",
    github_url: "https://github.com/o2sh/onefetch",
    image_url: nil
  },
  {
    name: "hexyl",
    description: "A command-line hex viewer",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/sharkdp/hexyl",
    github_url: "https://github.com/sharkdp/hexyl",
    image_url: nil
  },
  {
    name: "xxd",
    description: "Make a hexdump or do the reverse.",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/vim/vim",
    github_url: "https://github.com/vim/vim",
    image_url: nil
  },
  {
    name: "bat-extras",
    description: "Bash scripts that integrate bat with various command line tools",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/eth-p/bat-extras",
    github_url: "https://github.com/eth-p/bat-extras",
    image_url: nil
  },
  {
    name: "fzf-obc",
    description: "fzf source completion",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/rocky/fzf-obc",
    github_url: "https://github.com/rocky/fzf-obc",
    image_url: nil
  },
  {
    name: "nvm",
    description: "Node Version Manager - POSIX-compliant bash script to manage multiple active node.js versions",
    category: "Version Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/nvm-sh/nvm",
    github_url: "https://github.com/nvm-sh/nvm",
    image_url: nil
  },
  {
    name: "asdf",
    description: "Manage multiple runtime versions with a single CLI tool",
    category: "Version Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/asdf-vm/asdf",
    github_url: "https://github.com/asdf-vm/asdf",
    image_url: nil
  },
  {
    name: "rtx",
    description: "mise-en-place: The front-end to your dev env (formerly rtx)",
    category: "Version Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/jdx/mise",
    github_url: "https://github.com/jdx/mise",
    image_url: nil
  },
  {
    name: "fnm",
    description: "Fast and simple Node.js version manager, built in Rust",
    category: "Version Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/Schniz/fnm",
    github_url: "https://github.com/Schniz/fnm",
    image_url: nil
  },
  {
    name: "volta",
    description: "The Hassle-Free JavaScript Tool Manager",
    category: "Version Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/volta-cli/volta",
    github_url: "https://github.com/volta-cli/volta",
    image_url: nil
  },
  {
    name: "pyenv",
    description: "Simple Python version management",
    category: "Version Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/pyenv/pyenv",
    github_url: "https://github.com/pyenv/pyenv",
    image_url: nil
  },
  {
    name: "poetry",
    description: "Python dependency management and packaging made easy.",
    category: "Package Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/python-poetry/poetry",
    github_url: "https://github.com/python-poetry/poetry",
    image_url: nil
  },
  {
    name: "uv",
    description: "An extremely fast Python package and project manager, written in Rust.",
    category: "Package Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/astral-sh/uv",
    github_url: "https://github.com/astral-sh/uv",
    image_url: nil
  },
  {
    name: "ruff",
    description: "An extremely fast Python linter and code formatter, written in Rust.",
    category: "Linter / Formatter",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/astral-sh/ruff",
    github_url: "https://github.com/astral-sh/ruff",
    image_url: nil
  },
  {
    name: "pnpm",
    description: "Fast, disk space efficient package manager",
    category: "Package Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/pnpm/pnpm",
    github_url: "https://github.com/pnpm/pnpm",
    image_url: nil
  },
  {
    name: "bun",
    description: "Incredibly fast JavaScript runtime, bundler, test runner, and package manager",
    category: "Runtime / Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/oven-sh/bun",
    github_url: "https://github.com/oven-sh/bun",
    image_url: nil
  },
  {
    name: "deno",
    description: "A modern runtime for JavaScript and TypeScript.",
    category: "Runtime / Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/denoland/deno",
    github_url: "https://github.com/denoland/deno",
    image_url: nil
  },
  {
    name: "tldr",
    description: "Simplified and community-driven man pages",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/tldr-pages/tldr",
    github_url: "https://github.com/tldr-pages/tldr",
    image_url: nil
  },
  {
    name: "cheat",
    description: "cheat allows you to create and view interactive cheatsheets on the command-line.",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/cheat/cheat",
    github_url: "https://github.com/cheat/cheat",
    image_url: nil
  },
  {
    name: "broot",
    description: "A new way to see and navigate directory trees",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/Canop/broot",
    github_url: "https://github.com/Canop/broot",
    image_url: nil
  },
  {
    name: "lf",
    description: "Terminal file manager",
    category: "File Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/gokcehan/lf",
    github_url: "https://github.com/gokcehan/lf",
    image_url: nil
  },
  {
    name: "ranger",
    description: "A VIM-inspired filemanager for the console",
    category: "File Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/ranger/ranger",
    github_url: "https://github.com/ranger/ranger",
    image_url: nil
  },
  {
    name: "yazi",
    description: "Blazing fast terminal file manager written in Rust, based on async I/O.",
    category: "File Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/sxyazi/yazi",
    github_url: "https://github.com/sxyazi/yazi",
    image_url: nil
  },
  {
    name: "nnn",
    description: "n³ The unorthodox terminal file manager",
    category: "File Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/jarun/nnn",
    github_url: "https://github.com/jarun/nnn",
    image_url: nil
  },
  {
    name: "mc",
    description: "Midnight Commander is a visual file manager",
    category: "File Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/MidnightCommander/mc",
    github_url: "https://github.com/MidnightCommander/mc",
    image_url: nil
  },
  {
    name: "k9s",
    description: "Kubernetes CLI To Manage Your Clusters In Style",
    category: "TUI / Kubernetes",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/derailed/k9s",
    github_url: "https://github.com/derailed/k9s",
    image_url: nil
  },
  {
    name: "helm",
    description: "The Kubernetes Package Manager",
    category: "Kubernetes",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/helm/helm",
    github_url: "https://github.com/helm/helm",
    image_url: nil
  },
  {
    name: "kubectl",
    description: "Production-Grade Container Scheduling and Management",
    category: "Kubernetes",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/kubernetes/kubectl",
    github_url: "https://github.com/kubernetes/kubectl",
    image_url: nil
  },
  {
    name: "minikube",
    description: "Run Kubernetes locally",
    category: "Kubernetes",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/kubernetes/minikube",
    github_url: "https://github.com/kubernetes/minikube",
    image_url: nil
  },
  {
    name: "k3d",
    description: "Little helper to run CNCF's k3s in Docker",
    category: "Kubernetes",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/k3d-io/k3d",
    github_url: "https://github.com/k3d-io/k3d",
    image_url: nil
  },
  {
    name: "kind",
    description: "Kubernetes IN Docker - local clusters for testing Kubernetes",
    category: "Kubernetes",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/kubernetes-sigs/kind",
    github_url: "https://github.com/kubernetes-sigs/kind",
    image_url: nil
  },
  {
    name: "terraform",
    description: "Terraform enables you to safely and predictably create, change, and improve infrastructure.",
    category: "Infrastructure",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/hashicorp/terraform",
    github_url: "https://github.com/hashicorp/terraform",
    image_url: nil
  },
  {
    name: "terragrunt",
    description: "Terragrunt is a thin wrapper for Terraform that provides extra tools",
    category: "Infrastructure",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/gruntwork-io/terragrunt",
    github_url: "https://github.com/gruntwork-io/terragrunt",
    image_url: nil
  },
  {
    name: "pulumi",
    description: "Pulumi - Developer-First Infrastructure as Code",
    category: "Infrastructure",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/pulumi/pulumi",
    github_url: "https://github.com/pulumi/pulumi",
    image_url: nil
  },
  {
    name: "ansible",
    description: "Ansible is a radically simple IT automation platform",
    category: "Infrastructure",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/ansible/ansible",
    github_url: "https://github.com/ansible/ansible",
    image_url: nil
  },
  {
    name: "vagrant",
    description: "Vagrant is a tool for building and distributing development environments.",
    category: "Infrastructure",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/hashicorp/vagrant",
    github_url: "https://github.com/hashicorp/vagrant",
    image_url: nil
  },
  {
    name: "packer",
    description: "Packer is a tool for creating identical machine images for multiple platforms from a single source configuration.",
    category: "Infrastructure",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/hashicorp/packer",
    github_url: "https://github.com/hashicorp/packer",
    image_url: nil
  },
  {
    name: "docker",
    description: "A platform for developers and sysadmins to build, run, and share applications with containers.",
    category: "Container",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/docker/cli",
    github_url: "https://github.com/docker/cli",
    image_url: nil
  },
  {
    name: "podman",
    description: "A tool for managing OCI containers and pods.",
    category: "Container",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/containers/podman",
    github_url: "https://github.com/containers/podman",
    image_url: nil
  },
  {
    name: "lazydocker",
    description: "The lazier way to manage everything docker",
    category: "TUI / Container",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/jesseduffield/lazydocker",
    github_url: "https://github.com/jesseduffield/lazydocker",
    image_url: nil
  },
  {
    name: "dive",
    description: "A tool for exploring each layer in a docker image",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/wagoodman/dive",
    github_url: "https://github.com/wagoodman/dive",
    image_url: nil
  },
  {
    name: "skopeo",
    description: "Work with remote images registries - retrieving information, images, signing content",
    category: "Container",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/containers/skopeo",
    github_url: "https://github.com/containers/skopeo",
    image_url: nil
  },
  {
    name: "buildah",
    description: "A tool that facilitates building OCI images",
    category: "Container",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/containers/buildah",
    github_url: "https://github.com/containers/buildah",
    image_url: nil
  },
  {
    name: "aws-cli",
    description: "Universal Command Line Interface for Amazon Web Services",
    category: "Cloud",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/aws/aws-cli",
    github_url: "https://github.com/aws/aws-cli",
    image_url: nil
  },
  {
    name: "azure-cli",
    description: "Azure Command-Line Interface",
    category: "Cloud",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/Azure/azure-cli",
    github_url: "https://github.com/Azure/azure-cli",
    image_url: nil
  },
  {
    name: "google-cloud-sdk",
    description: "Google Cloud CLI",
    category: "Cloud",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/googleapis/google-cloud-python",
    github_url: "https://github.com/googleapis/google-cloud-python",
    image_url: nil
  },
  {
    name: "doctl",
    description: "The official command line interface for the DigitalOcean API",
    category: "Cloud",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/digitalocean/doctl",
    github_url: "https://github.com/digitalocean/doctl",
    image_url: nil
  },
  {
    name: "flyctl",
    description: "Command line tools for fly.io",
    category: "Cloud",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/superfly/flyctl",
    github_url: "https://github.com/superfly/flyctl",
    image_url: nil
  },
  {
    name: "vercel",
    description: "Vercel CLI",
    category: "Cloud",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/vercel/vercel",
    github_url: "https://github.com/vercel/vercel",
    image_url: nil
  },
  {
    name: "netlify-cli",
    description: "Netlify Command Line Interface",
    category: "Cloud",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/netlify/cli",
    github_url: "https://github.com/netlify/cli",
    image_url: nil
  },
  {
    name: "heroku-cli",
    description: "Heroku CLI",
    category: "Cloud",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/heroku/cli",
    github_url: "https://github.com/heroku/cli",
    image_url: nil
  },
  {
    name: "wrangler",
    description: "Cloudflare Workers CLI",
    category: "Cloud",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/cloudflare/workers-sdk",
    github_url: "https://github.com/cloudflare/workers-sdk",
    image_url: nil
  },
  {
    name: "ngrok",
    description: "Secure introspectable tunnels to localhost webhook development tool and debugging tool.",
    category: "Network",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/inconshreveable/ngrok",
    github_url: "https://github.com/inconshreveable/ngrok",
    image_url: nil
  },
  {
    name: "localtunnel",
    description: "localtunnel exposes your localhost to the world for easy testing and sharing!",
    category: "Network",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/localtunnel/localtunnel",
    github_url: "https://github.com/localtunnel/localtunnel",
    image_url: nil
  },
  {
    name: "caddy",
    description: "Fast and extensible multi-platform HTTP/1-2-3 web server with automatic HTTPS",
    category: "Web Server",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/caddyserver/caddy",
    github_url: "https://github.com/caddyserver/caddy",
    image_url: nil
  },
  {
    name: "nginx",
    description: "NGINX is a high performance edge web server",
    category: "Web Server",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/nginx/nginx",
    github_url: "https://github.com/nginx/nginx",
    image_url: nil
  },
  {
    name: "hugo",
    description: "The world's fastest framework for building websites.",
    category: "Static Site Generator",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/gohugoio/hugo",
    github_url: "https://github.com/gohugoio/hugo",
    image_url: nil
  },
  {
    name: "zola",
    description: "A fast static site generator in a single binary with everything built-in.",
    category: "Static Site Generator",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/getzola/zola",
    github_url: "https://github.com/getzola/zola",
    image_url: nil
  },
  {
    name: "jekyll",
    description: "Jekyll is a blog-aware static site generator in Ruby",
    category: "Static Site Generator",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/jekyll/jekyll",
    github_url: "https://github.com/jekyll/jekyll",
    image_url: nil
  },
  {
    name: "eleventy",
    description: "A simpler static site generator",
    category: "Static Site Generator",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/11ty/eleventy",
    github_url: "https://github.com/11ty/eleventy",
    image_url: nil
  },
  {
    name: "astro",
    description: "The web framework for content-driven websites.",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/withastro/astro",
    github_url: "https://github.com/withastro/astro",
    image_url: nil
  },
  {
    name: "next.js",
    description: "The React Framework",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/vercel/next.js",
    github_url: "https://github.com/vercel/next.js",
    image_url: nil
  },
  {
    name: "nuxt",
    description: "The Intuitive Vue Framework.",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/nuxt/nuxt",
    github_url: "https://github.com/nuxt/nuxt",
    image_url: nil
  },
  {
    name: "sveltekit",
    description: "The fastest way to build Svelte apps.",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/sveltejs/kit",
    github_url: "https://github.com/sveltejs/kit",
    image_url: nil
  },
  {
    name: "remix",
    description: "Build Better Websites. Create modern, resilient user experiences with web fundamentals.",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/remix-run/remix",
    github_url: "https://github.com/remix-run/remix",
    image_url: nil
  },
  {
    name: "vite",
    description: "Next generation frontend tooling. It's fast!",
    category: "Build Tool",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/vitejs/vite",
    github_url: "https://github.com/vitejs/vite",
    image_url: nil
  },
  {
    name: "esbuild",
    description: "An extremely fast JavaScript and CSS bundler and minifier.",
    category: "Build Tool",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/evanw/esbuild",
    github_url: "https://github.com/evanw/esbuild",
    image_url: nil
  },
  {
    name: "swc",
    description: "Rust-based platform for the Web",
    category: "Build Tool",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/swc-project/swc",
    github_url: "https://github.com/swc-project/swc",
    image_url: nil
  },
  {
    name: "biome",
    description: "A toolchain for web projects, aimed to provide functionalities to maintain them.",
    category: "Linter / Formatter",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/biomejs/biome",
    github_url: "https://github.com/biomejs/biome",
    image_url: nil
  },
  {
    name: "prettier",
    description: "Prettier is an opinionated code formatter.",
    category: "Linter / Formatter",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/prettier/prettier",
    github_url: "https://github.com/prettier/prettier",
    image_url: nil
  },
  {
    name: "eslint",
    description: "Find and fix problems in your JavaScript code.",
    category: "Linter / Formatter",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/eslint/eslint",
    github_url: "https://github.com/eslint/eslint",
    image_url: nil
  },
  {
    name: "typescript",
    description: "TypeScript is a superset of JavaScript that compiles to clean JavaScript output.",
    category: "Compiler",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/microsoft/TypeScript",
    github_url: "https://github.com/microsoft/TypeScript",
    image_url: nil
  },
  {
    name: "rustup",
    description: "The Rust toolchain installer",
    category: "Version Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/rust-lang/rustup",
    github_url: "https://github.com/rust-lang/rustup",
    image_url: nil
  },
  {
    name: "cargo",
    description: "The Rust package manager",
    category: "Package Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/rust-lang/cargo",
    github_url: "https://github.com/rust-lang/cargo",
    image_url: nil
  },
  {
    name: "clippy",
    description: "A bunch of lints to catch common mistakes and improve your Rust code.",
    category: "Linter / Formatter",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/rust-lang/rust-clippy",
    github_url: "https://github.com/rust-lang/rust-clippy",
    image_url: nil
  },
  {
    name: "rustfmt",
    description: "A tool for formatting Rust code according to style guidelines.",
    category: "Linter / Formatter",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/rust-lang/rustfmt",
    github_url: "https://github.com/rust-lang/rustfmt",
    image_url: nil
  },
  {
    name: "golang",
    description: "The Go programming language",
    category: "Compiler",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/golang/go",
    github_url: "https://github.com/golang/go",
    image_url: nil
  },
  {
    name: "gofmt",
    description: "Gofmt formats Go programs.",
    category: "Linter / Formatter",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/golang/go",
    github_url: "https://github.com/golang/go",
    image_url: nil
  },
  {
    name: "golangci-lint",
    description: "Fast linters runner for Go.",
    category: "Linter / Formatter",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/golangci/golangci-lint",
    github_url: "https://github.com/golangci/golangci-lint",
    image_url: nil
  },
  {
    name: "delve",
    description: "Delve is a debugger for the Go programming language.",
    category: "Debugger",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/go-delve/delve",
    github_url: "https://github.com/go-delve/delve",
    image_url: nil
  },
  {
    name: "ruby",
    description: "The Ruby Programming Language",
    category: "Runtime",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/ruby/ruby",
    github_url: "https://github.com/ruby/ruby",
    image_url: nil
  },
  {
    name: "bundler",
    description: "Manage your Ruby application's gem dependencies",
    category: "Package Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/rubygems/rubygems",
    github_url: "https://github.com/rubygems/rubygems",
    image_url: nil
  },
  {
    name: "rubocop",
    description: "A Ruby static code analyzer and formatter, based on the community Ruby style guide.",
    category: "Linter / Formatter",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/rubocop/rubocop",
    github_url: "https://github.com/rubocop/rubocop",
    image_url: nil
  },
  {
    name: "rails",
    description: "Ruby on Rails",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/rails/rails",
    github_url: "https://github.com/rails/rails",
    image_url: nil
  },
  {
    name: "php",
    description: "The PHP source repository",
    category: "Runtime",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/php/php-src",
    github_url: "https://github.com/php/php-src",
    image_url: nil
  },
  {
    name: "composer",
    description: "Dependency Manager for PHP",
    category: "Package Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/composer/composer",
    github_url: "https://github.com/composer/composer",
    image_url: nil
  },
  {
    name: "laravel",
    description: "A PHP framework for web artisans",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/laravel/laravel",
    github_url: "https://github.com/laravel/laravel",
    image_url: nil
  },
  {
    name: "phpunit",
    description: "The PHP Unit Testing framework.",
    category: "Testing",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/sebastianbergmann/phpunit",
    github_url: "https://github.com/sebastianbergmann/phpunit",
    image_url: nil
  },
  {
    name: "java",
    description: "OpenJDK",
    category: "Compiler",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/openjdk/jdk",
    github_url: "https://github.com/openjdk/jdk",
    image_url: nil
  },
  {
    name: "maven",
    description: "Apache Maven",
    category: "Build Tool",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/apache/maven",
    github_url: "https://github.com/apache/maven",
    image_url: nil
  },
  {
    name: "gradle",
    description: "Adaptable, fast automation for all",
    category: "Build Tool",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/gradle/gradle",
    github_url: "https://github.com/gradle/gradle",
    image_url: nil
  },
  {
    name: "spring-boot",
    description: "Spring Boot",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/spring-projects/spring-boot",
    github_url: "https://github.com/spring-projects/spring-boot",
    image_url: nil
  },
  {
    name: "kotlin",
    description: "The Kotlin Programming Language.",
    category: "Compiler",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/JetBrains/kotlin",
    github_url: "https://github.com/JetBrains/kotlin",
    image_url: nil
  },
  {
    name: "swift",
    description: "The Swift Programming Language",
    category: "Compiler",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/apple/swift",
    github_url: "https://github.com/apple/swift",
    image_url: nil
  },
  {
    name: "xcode",
    description: "Xcode",
    category: "IDE / Toolchain",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/apple/swift",
    github_url: "https://github.com/apple/swift",
    image_url: nil
  },
  {
    name: "cocoapods",
    description: "The Dependency Manager for iOS & Mac projects.",
    category: "Package Manager",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/CocoaPods/CocoaPods",
    github_url: "https://github.com/CocoaPods/CocoaPods",
    image_url: nil
  },
  {
    name: "fastlane",
    description: "The easiest way to automate building and releasing your iOS and Android apps",
    category: "Utility",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/fastlane/fastlane",
    github_url: "https://github.com/fastlane/fastlane",
    image_url: nil
  },
  {
    name: "flutter",
    description: "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/flutter/flutter",
    github_url: "https://github.com/flutter/flutter",
    image_url: nil
  },
  {
    name: "react-native",
    description: "A framework for building native applications using React",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/facebook/react-native",
    github_url: "https://github.com/facebook/react-native",
    image_url: nil
  },
  {
    name: "expo",
    description: "An open-source platform for making universal native apps with React.",
    category: "Web Framework",
    stable_version: "latest",
    beta_version: nil,
    website_url: "https://github.com/expo/expo",
    github_url: "https://github.com/expo/expo",
    image_url: nil
  }
]


tools.each do |tool_attrs|
  Tool.create!(tool_attrs)
end

puts "Seeded #{Tool.count} tools!"
