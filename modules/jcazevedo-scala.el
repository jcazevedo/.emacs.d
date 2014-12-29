(require 'jcazevedo/programming)
(jcazevedo/require-packages '(scala-mode2 ensime))

(require 'ensime)

(defun jcazevedo/scala-mode-defaults ())

(setq jcazevedo/scala-mode-hook 'jcazevedo/scala-mode-defaults)

(add-hook 'scala-mode-hook (lambda ()
                             (run-hooks 'jcazevedo/scala-mode-hook)))
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(provide 'jcazevedo/scala)
