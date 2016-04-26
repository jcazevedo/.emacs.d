(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :init
  (setq-default js2-basic-offset 2)
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))

(provide 'jcazevedo-javascript)
