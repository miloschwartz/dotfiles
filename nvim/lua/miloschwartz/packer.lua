vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {
        'wbthomason/packer.nvim'
    }

    use {
        'nvim-lua/plenary.nvim'
    }

    use {
        "nvim-telescope/telescope-live-grep-args.nvim"
    }

    use {
        'nvim-telescope/telescope.nvim',
        after = {
            "telescope-live-grep-args.nvim",
            'plenary.nvim'
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        after = "plenary.nvim"
    }

    use {
        'mbbill/undotree'
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {
                'williamboman/mason.nvim'
            },
            {
                'williamboman/mason-lspconfig.nvim'
            },
            {
                'neovim/nvim-lspconfig'
            },
            {
                'hrsh7th/nvim-cmp'
            },
            {
                'hrsh7th/cmp-nvim-lsp'
            },
            {
                'L3MON4D3/LuaSnip'
            },
        }
    }

    use {
        'sbdchd/neoformat'
    }

    use {
        'github/copilot.vim',
        branch = 'release'
    }

    use {
        "windwp/nvim-autopairs"
    }

    use {
        'rlane/pounce.nvim'
    }

    use {
        'dmmulroy/tsc.nvim'
    }

    use {
        'unblevable/quick-scope'
    }

    use {
        'tomtom/tcomment_vim'
    }

    use {
        "kylechui/nvim-surround"
    }

    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter"
    }

    use {
        "aznhe21/actions-preview.nvim"
    }

    use {
        "stevearc/oil.nvim"
    }

    use {
        'nvim-tree/nvim-tree.lua'
    }

    use {
        "lewis6991/gitsigns.nvim"
    }

    use {
        "echasnovski/mini.nvim"
    }

    use {
        "tpope/vim-fugitive"
    }

    use {
        "nvim-pack/nvim-spectre"
    }

    use {
        "christoomey/vim-tmux-navigator"
    }

    use {
        "epwalsh/obsidian.nvim"
    }

    use {
        "projekt0n/github-nvim-theme"
    }

    use {
        "tpope/vim-sleuth"
    }

    use {
        "arzg/vim-colors-xcode"
    }
end)
