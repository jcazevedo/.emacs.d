;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'jcazevedo-global-keybindings)
