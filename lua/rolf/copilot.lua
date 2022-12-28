vim.g.copilot_no_tab_map = true
local keymap = vim.api.nvim_set_keymap
vim.cmd([[imap <silent><script><expr> <Leader><Tab> copilot#Accept("")]])
vim.cmd([[highlight CopilotSuggestion guifg=#9B8F3C]])
