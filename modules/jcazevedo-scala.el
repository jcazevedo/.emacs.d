(use-package scala-mode
  :ensure t
  :mode "\\.\\(scala\\|sbt\\)\\'")

(use-package ensime
  :pin melpa-stable
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
  (defun jcazevedo/maybe-start-ensime ()
    (when (buffer-file-name)
      (let ((ensime-buffer (jcazevedo/ensime-buffer-for-file (buffer-file-name)))
            (file (ensime-config-find-file (buffer-file-name)))
            (is-source-file (s-matches? (rx (or "/src/" "/test/")) (buffer-file-name))))

        (when (and is-source-file (null ensime-buffer))
          (noflet ((ensime-config-find (&rest _) file))
            (save-window-excursion
              (ensime)))))))
  (setq ensime-startup-snapshot-notification nil)
  (setq ensime-sem-high-enabled-p nil)
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  (add-hook 'scala-mode-hook 'jcazevedo/configure-ensime)
  (add-hook 'scala-mode-hook 'jcazevedo/maybe-start-ensime))

(provide 'jcazevedo-scala)
