(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package git-timemachine
  :ensure t)

(use-package gitattributes-mode
  :ensure t
  :mode "/\\.gitattributes\\'" "/\\.git/info/attributes\\'" "/git/attributes\\'")

(use-package gitconfig-mode
  :ensure t
  :mode "/\\.gitconfig\\'" "/\\.git/config\\'" "/git/config\\'" "/\\.gitmodules\\'")

(use-package gitignore-mode
  :ensure t
  :mode "/\\.gitignore\\'" "/\\.git/info/exclude\\'" "/git/ignore\\'")

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode 1)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(provide 'jcazevedo-vc)
