(jcazevedo/require-packages
 '(helm
   helm-ag
   helm-descbinds
   helm-projectile))

(require 'helm)
(require 'helm-grep)
(require 'helm-files)

(setq helm-command-prefix-key "C-c h")

(require 'helm-config)
(require 'helm-projectile)

(setq helm-quick-update                     t
      helm-split-window-in-side-p           t
      helm-buffers-fuzzy-matching           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-ff-auto-update-initial-value     nil
      helm-ff-file-name-history-use-recentf t)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-command-map   (kbd "o")   'helm-occur)
(define-key helm-command-map   (kbd "g")   'helm-do-grep)

(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-x b")   'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f")   'helm-apropos)
(global-set-key (kbd "C-h r")   'helm-info-emacs)
(global-set-key (kbd "C-h C-l") 'helm-locate-library)

(helm-descbinds-mode)
(helm-mode 1)
(helm-projectile-on)

(provide 'jcazevedo-helm)
