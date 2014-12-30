(jcazevedo/require-packages '(restclient))

(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))

(provide 'jcazevedo-restclient)
