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

(use-package noflet
  :ensure t)

(when (eq system-type 'darwin)
  (progn
    (when (memq window-system '(mac ns))
      (use-package exec-path-from-shell
        :ensure t
        :init
        (setq exec-path-from-shell-check-startup-files nil)
        :config
        (exec-path-from-shell-initialize)))
    (setq ns-use-native-fullscreen nil)
    (setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier nil)
    (setq ns-function-modifier 'hyper)))

(provide 'jcazevedo-core)
