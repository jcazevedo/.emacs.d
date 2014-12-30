(jcazevedo/require-packages '(markdown-mode))

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'jcazevedo-markdown)
