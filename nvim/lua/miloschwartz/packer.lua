vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {
        'wbthomason/packer.nvim',
        commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3"
    }

    use {
        'nvim-lua/plenary.nvim',
        commit = "8aad4396840be7fc42896e3011751b7609ca4119"
    }

    use {
        "nvim-telescope/telescope-live-grep-args.nvim",
        commit = "731a046da7dd3adff9de871a42f9b7fb85f60f47"
    }

    use {
        'nvim-telescope/telescope.nvim',
        commit = "5a701e99906961218b55d7ad6c2a998f066c6fe0",
        after = {
            "telescope-live-grep-args.nvim",
            'plenary.nvim'
        }
    }

    use {
        "catppuccin/nvim",
        as = "catppuccin",
        commit = "08c6417bdc3b29e5f8c53e2cfe4067f288d49a54"
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        commit = 'ef267f0c285928ea3a0d3362a260a0728fd4a146'
    }

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        after = "plenary.nvim",
        commit = "0378a6c428a0bed6a2781d459d7943843f374bce"
    }

    use {
        'mbbill/undotree',
        commit = "aa93a7e5890dbbebbc064cd22260721a6db1a196"
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    use {'sbdchd/neoformat'}

    use {'github/copilot.vim', branch = 'release'}

    use {'alvan/vim-closetag'}

    use {"windwp/nvim-autopairs"}

    use {'rlane/pounce.nvim'}

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
    }

    use {'dmmulroy/tsc.nvim'}

    use {"ray-x/lsp_signature.nvim"}

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true}
    }

    use {'nvim-tree/nvim-web-devicons'}

    use {'unblevable/quick-scope'}

    use {'tomtom/tcomment_vim'}

    use {"kylechui/nvim-surround", tag = "*"}

    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    }

    use {
        "aznhe21/actions-preview.nvim",
    }

    use {
        'VonHeikemen/fine-cmdline.nvim',
        requires = {
            {'MunifTanjim/nui.nvim'}
        }
    }

    use {
        "stevearc/oil.nvim",
    }

    use {'nvim-tree/nvim-tree.lua'}
end)
