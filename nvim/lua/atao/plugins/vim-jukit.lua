return {
	"vim-jukit.lua",
	config = function()
		local vimjukit = require("vim-jukit")
		-- Set value for `dpi` argument for matplotlib's `savefig` function
		vim.g.jukit_savefig_dpi = 150

		-- If set to 0, then `plt.show()` will by default be executed as if `plt.show(block=False)` was specified
		vim.g.jukit_mpl_block = 1

		-- Custom matplotlib backend to use
		vim.g.jukit_custom_backend = -1

		-- Check if Kitty or Tmux is being used and set `jukit_mpl_style` and `jukit_inline_plotting` accordingly
		local isKittyOrTmuxUsed = function()
			local terminal = vim.g.jukit_terminal or ""
			return terminal == "kitty" or terminal == "tmux"
		end

		if isKittyOrTmuxUsed() and vim.g.jukit_terminal == "kitty" then
			-- File specifying matplotlib plot options. This is the default value if kitty terminal is used
			vim.g.jukit_mpl_style = vim.fn["jukit#util#plugin_path"]()
				.. "/helpers/matplotlib-backend-kitty/backend.mplstyle"
			-- Enable in-terminal-plotting. Only supported for kitty or tmux+iTerm2
			vim.g.jukit_inline_plotting = 1
		elseif isKittyOrTmuxUsed() then
			-- Enable in-terminal plotting for tmux+iTerm2 without changing mpl_style
			vim.g.jukit_inline_plotting = 1
		else
			-- File specifying matplotlib plot options. This is the default value if kitty terminal is NOT used.
			vim.g.jukit_mpl_style = ""
			-- Disable in-terminal-plotting
			vim.g.jukit_inline_plotting = 0
		end

		-- Define a custom split layout as a table, the default is:
		vimjukit.setup({
			jukit_layout = {
				split = "horizontal",
				p1 = 0.6,
				val = {
					"file_content",
					{
						split = "vertical",
						p1 = 0.6,
						val = { "output", "output_history" },
					},
				},
			},
		})
	end,
}
