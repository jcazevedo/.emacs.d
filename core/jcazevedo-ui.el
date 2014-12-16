;; Disable toolbar, menubar and scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; Use zenburn as the default theme
(load-theme 'zenburn t)

(provide 'jcazevedo-ui)
