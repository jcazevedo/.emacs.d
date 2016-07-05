(use-package markdown-mode
  :ensure t
  :mode "\\.markdown\\'" "\\.md\\'"
  :init
  (setq markdown-command "marked --gfm")
  :config
  (use-package markdown-toc
    :ensure t))

(provide 'jcazevedo-markdown)
