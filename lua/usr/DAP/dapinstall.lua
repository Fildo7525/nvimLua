-- local status, dap_install = pcall(require, 'dap-install')
-- if not status then
-- 	vim.notify("dap-install error")
-- 	return
-- end
--
-- dap_install.setup({
-- 	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
-- })
--
-- if dbg_list == nil then
-- 	vim.notify("No debuggers downloaded")
-- 	return
-- end
--
-- for _, debugger in ipairs(dbg_list) do
-- 	dap_install.config(debugger)
-- end
