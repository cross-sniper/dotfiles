function keymap(mode, keybind, command, other)
	if mode == "i" then
		vim.api.nvim_set_keymap(mode, keybind, "<Esc><cmd>" .. command .. "<cr>", other or {})
	else
		vim.api.nvim_set_keymap(mode, keybind, "<cmd>" .. command .. "<cr>", other or {})
	end
end


return {
	keymap = keymap
}
