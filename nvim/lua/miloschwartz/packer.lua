vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { "nvim-telescope/telescope-live-grep-args.nvim" }
        }
    }

    -- use({ 'rose-pine/neovim', as = 'rose-pine' })
    use { "catppuccin/nvim", as = "catppuccin" }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use "nvim-lua/plenary.nvim"
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use { 'sbdchd/neoformat' }

    use { 'github/copilot.vim', branch = 'release' }

    use { 'alvan/vim-closetag' }

    use({ 'rebelot/terminal.nvim' })

    use({"windwp/nvim-autopairs"})

    use({'rlane/pounce.nvim'})

    use({"danymat/neogen", depends = {"nvim-treesitter/nvim-treesitter"}})

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use('dmmulroy/tsc.nvim')

    use { "ray-x/lsp_signature.nvim", }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'nvim-tree/nvim-web-devicons'

    -- use {
    --     'nvim-tree/nvim-tree.lua',
    -- }

    use 'unblevable/quick-scope'

    -- use { 'nvim-treesitter/nvim-treesitter-context' }

    use 'tomtom/tcomment_vim'

    use({ "kylechui/nvim-surround", tag = "*" })

    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    -- use "lukas-reineke/indent-blankline.nvim"

    use {
        "aznhe21/actions-preview.nvim",
    }

    use {
        'VonHeikemen/fine-cmdline.nvim',
        requires = {
            {'MunifTanjim/nui.nvim'}
        }
    }

    use({
        "stevearc/oil.nvim",
    })
end)
