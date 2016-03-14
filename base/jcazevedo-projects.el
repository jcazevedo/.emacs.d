(use-package projectile
  :ensure t
  :init
  (setq projectile-cache-file
        (expand-file-name  "projectile.cache" jcazevedo/config-savefile-dir))
  :config
  (projectile-global-mode 1))

(provide 'jcazevedo-projects)
