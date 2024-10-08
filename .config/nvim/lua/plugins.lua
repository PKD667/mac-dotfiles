return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox'
    use 'rust-lang/rust.vim'
    use 'luochen1990/rainbow'
    use 'neovimhaskell/haskell-vim'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-abolish'
    use 'Shirk/vim-gas'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'nvim-lua/plenary.nvim'
    -- use 'gfanto/fzf-lsp.nvim'
    use 'BurntSushi/ripgrep'
    use 'DingDean/wgsl.vim'
    use 'alaviss/nim.nvim'
    use 'neovim/nvim-lspconfig'
    use { 'ray-x/lsp_signature.nvim', commit = "1d96fac72eb6d74abd5b4d7883a01f58aeb4f87e" }
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'nvim-treesitter/nvim-treesitter'
    use 'hrsh7th/vim-vsnip'
    use 'SirVer/ultisnips'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'zefei/vim-colortuner'
    use 'sbdchd/neoformat'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'ntpeters/vim-better-whitespace'
    use 'windwp/nvim-autopairs'
    use 'preservim/vimux'
    use 'easymotion/vim-easymotion'
    use 'mfussenegger/nvim-dap'
    use 'simrat39/symbols-outline.nvim'
    use 'RRethy/vim-illuminate'
    use 'tommcdo/vim-lion'
    use 'sindrets/diffview.nvim'
    use 'honza/vim-snippets'
    use 'kelly-lin/ranger.nvim'
    use({
    	"frankroeder/parrot.nvim",
    	requires = {'nvim-lua/plenary.nvim'},
    	config = function()
            require("parrot").setup()
    	end,
  	})
    end)

