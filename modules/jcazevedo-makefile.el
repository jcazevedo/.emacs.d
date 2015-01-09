(require 'jcazevedo-programming)

(defun jcazevedo/makefile-mode-defaults ()
  (whitespace-toggle-options '(tabs))
  (setq indent-tabs-mode t))

(setq jcazevedo/makefile-mode-hook 'jcazevedo/makefile-mode-defaults)

(add-hook 'makefile-mode-hook (lambda ()
                                (run-hooks 'jcazevedo/makefile-mode-hook)))

(provide 'jcazevedo-makefile)
