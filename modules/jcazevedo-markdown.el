(use-package markdown-mode
  :ensure t
  :mode "\\.markdown\\'" "\\.md\\'"
  :config
  (use-package markdown-toc
    :ensure t))

(provide 'jcazevedo-markdown)
