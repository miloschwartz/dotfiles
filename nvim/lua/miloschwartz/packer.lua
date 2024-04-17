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
            {
                'williamboman/mason.nvim',
                commit = "751b1fcbf3d3b783fcf8d48865264a9bcd8f9b10"
            },
            {
                'williamboman/mason-lspconfig.nvim',
                commit = "44509689b9bf3984d729cc264aacb31cb7f41668"
            },
            {
                'neovim/nvim-lspconfig',
                commit = "b3014f2209503944f2714cf27c95591433a0c7d8"
            },
            {
                'hrsh7th/nvim-cmp',
                commit = "ce16de5665c766f39c271705b17fff06f7bcb84f"
            },
            {
                'hrsh7th/cmp-nvim-lsp',
                commit = "5af77f54de1b16c34b23cba810150689a3a90312"
            },
            {
                'L3MON4D3/LuaSnip',
                commit = "be7be2ca7f55bb881a7ffc16b2efa5af034ab06b"
            },
        }
    }

    use {
        'sbdchd/neoformat',
        commit = "4372abb846f43ec121df40e620682c985ebc8286"
    }

    use {
        'github/copilot.vim',
        branch = 'release',
        commit = "1e135c5303bc60598f6314a2276f31dc91aa34dd"
    }

    use {
        'alvan/vim-closetag',
        commit = "d0a562f8bdb107a50595aefe53b1a690460c3822"
    }

    use {
        "windwp/nvim-autopairs",
        commit = "4f41e5940bc0443fdbe5f995e2a596847215cd2a"
    }

    use {
        'rlane/pounce.nvim',
        commit = "0c044cad69571d57d8f64a41cca95332859b6abc"
    }

    use {
        'dmmulroy/tsc.nvim',
        commit = "2576637ce46aed84240da33496eee6430b0f0248"
    }

    use {
        "ray-x/lsp_signature.nvim",
        commit = "c6aeb2f1d2538bbdfdaab1664d9d4c3c75aa9db8"
    }

    use {
        'nvim-tree/nvim-web-devicons',
        commit = "6e355632387a085f15a66ad68cf681c1d7374a04"
    }

    use {
        'nvim-lualine/lualine.nvim',
        after = 'nvim-web-devicons',
        commit = "0a5a66803c7407767b799067986b4dc3036e1983"
    }

    use {
        'unblevable/quick-scope',
        commit = "256d81e391a22eeb53791ff62ce65f870418fa71"
    }

    use {
        'tomtom/tcomment_vim',
        commit = "48ab639a461d9b8344f7fee06cb69b4374863b13"
    }

    use {
        "kylechui/nvim-surround",
        commit = "a4e30d33add8a9743b4f518b3a788b3c8e5def71"
    }

    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        commit = "c180aef9a197e9fe64cc285171910b8ea1400952"
    }

    use {
        "aznhe21/actions-preview.nvim",
        commit = "5072b1b1065a6b22bdd46b5c21780a91d6a08071"
    }

    use {
        "stevearc/oil.nvim",
        commit = "e462a3446505185adf063566f5007771b69027a1"
    }

    use {
        'nvim-tree/nvim-tree.lua',
        commit = "81eb8d519233c105f30dc0a278607e62b20502fd"
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        commit = "5ee5002373655fd684a4ad0d47a3de876ceacf9a",
        after = {
            "telescope.nvim",
            "plenary.nvim"
        }
    }

    use {
        "lewis6991/gitsigns.nvim",
        commit = "d96ef3bbff0bdbc3916a220f5c74a04c4db033f2"
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        commit = "3d08501caef2329aba5121b753e903904088f7e6"
    }

    use {
        "echasnovski/mini.nvim",
        commit = "e3d13e2c89a9dfda51c69c825360d1fe5be0e322"
    }

    use {
        "tpope/vim-fugitive",
        commit = "dac8e5c2d85926df92672bf2afb4fc48656d96c7"
    }

    use {
        "stefandtw/quickfix-reflector.vim",
        commit = "6a6a9e28e1713b9e9db99eec1e6672e5666c01b9"
    }
end)
