(defconst jcazevedo/initial-gc-cons-threshold gc-cons-threshold)
(setq gc-cons-threshold (* 128 1000 1000)
      large-file-warning-threshold 100000000)

(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold jcazevedo/initial-gc-cons-threshold)))
(add-hook 'minibuffer-setup-hook
          (lambda () (setq gc-cons-threshold most-positive-fixnum)))
(add-hook 'minibuffer-exit-hook
          (lambda () (setq gc-cons-threshold jcazevedo/initial-gc-cons-threshold)))

(use-package discover-my-major
  :ensure t
  :commands (discover-my-major discover-my-mode)
  :bind (("C-h C-m" . discover-my-major)
         ("C-h M-m" . discover-my-mode)))

(provide 'jcazevedo-core)
