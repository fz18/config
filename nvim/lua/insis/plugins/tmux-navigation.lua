local status, nvim_tmux = pcall(require, "nvim-tmux-navigation")
if not status then
  vim.notify("没有找到 nvim-tree")
  return
end

nvim_tmux.setup {
   keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
            }
}
