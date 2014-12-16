(defun jcazevedo-prog-mode-defaults ()
  "Default coding hook, useful with any programming language."
  (jcazevedo-enable-whitespace))

(setq jcazevedo-prog-mode-hook 'jcazevedo-prog-mode-defaults)

(add-hook 'prog-mode-hook (lambda ()
                            (run-hooks 'jcazevedo-prog-mode-hook)))

(provide 'jcazevedo-programming)
