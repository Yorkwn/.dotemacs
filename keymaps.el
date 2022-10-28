;;Initial C-z minimize is useless, so let's have it be the undo
(global-set-key (kbd "C-z") 'undo)

;;Stupid Ctrl-g
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;Running the compile command
(global-set-key (kbd "C-c c") 'compile)

;;Resize text without prefix
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;;Keep the muscle-memory keymap from other editors
(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-σ") 'save-buffer) ;;works for greek as well

;;Search forward for a word
(global-set-key (kbd "<f2>") 'isearch-forward)

;;Kill buffer without asking which one
(global-unset-key (kbd "C-x k"))
(global-set-key (kbd "C-x k") 'gk/kill-buffer)

;;Delete line before cursor
(global-set-key (kbd "C-S-k") 'gk/kill-line-backwards)

;;Switch buffers
(global-set-key (kbd "C-<tab>") 'next-buffer)
(global-set-key (kbd "C-<iso-lefttab>") 'previous-buffer)
