(use-package ess
  :ensure t
  :init
  (add-hook 'ess-mode-hook 'jcazevedo/enable-whitespace-mode)
  (add-hook 'ess-mode-hook 'smartparens-mode)
  (add-hook 'ess-mode-hook 'jcazevedo/enable-linum-mode)
  :config
  (require 'ess-site))

(provide 'jcazevedo-r)
