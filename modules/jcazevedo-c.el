(require 'jcazevedo-programming)

(defun jcazevedo/c-mode-common-defaults ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))

(setq jcazevedo/c-mode-common-hook 'jcazevedo/c-mode-common-defaults)

(add-hook 'c-mode-common-hook (lambda ()
                                (run-hooks 'jcazevedo/c-mode-common-hook)))

(provide 'jcazevedo-c)
