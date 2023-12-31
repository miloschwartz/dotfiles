vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({ 'rose-pine/neovim', as = 'rose-pine',
    config = function()
        require('rose-pine').setup({
            variant = 'auto',
            disable_italics = true,
        })
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

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

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {'github/copilot.vim', branch = 'release' }
end)

