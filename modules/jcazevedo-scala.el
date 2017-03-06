(use-package scala-mode
  :ensure t
  :mode "\\.\\(scala\\|sbt\\)\\'"
  :init
  (setq scala-indent:use-javadoc-style t))

(use-package ensime
  :ensure t
  :after scala-mode
  :init
  (defun jcazevedo/configure-ensime ()
    (cond
     ((and (buffer-file-name) (file-exists-p (buffer-file-name)))
      (ensime-mode 1))
     ((buffer-file-name)
      (add-hook 'after-save-hook (lambda () (ensime-mode 1)) nil t))))
  (defun jcazevedo/ensime-buffer-for-file (file)
    (let ((default-directory (file-name-directory file)))
      (-when-let (project-name (projectile-project-p))
        (--first (-when-let (bufname (buffer-name it))
                   (and (s-contains? "*ENSIME-" bufname)
                        (s-contains? (file-name-nondirectory project-name) bufname)))
                 (buffer-list)))))
  (setq ensime-startup-snapshot-notification nil)
  (setq ensime-sem-high-enabled-p nil)
  (add-hook 'scala-mode-hook 'jcazevedo/configure-ensime))

(provide 'jcazevedo-scala)
