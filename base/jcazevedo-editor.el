(setq-default indent-tabs-mode nil
              tab-width 8
              fill-column 80)

(setq require-final-newline t
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      undo-tree-history-directory-alist `((".*" . ,temporary-file-directory))
      undo-tree-auto-save-history t
      tab-always-indent 'complete)

(delete-selection-mode 1)
(global-auto-revert-mode 1)
(global-hl-line-mode 1)
(winner-mode 1)

(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward
      uniquify-separator "/"
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*")

(use-package saveplace
  :ensure t
  :init
  (unless (file-exists-p jcazevedo/config-savefile-dir)
    (make-directory jcazevedo/config-savefile-dir))
  (setq save-place-file (expand-file-name "saveplace"
                                          jcazevedo/config-savefile-dir))
  (setq-default save-place t))

(use-package savehist
  :ensure t
  :init
  (setq savehist-additional-variables '(search-ring regexp-search-ring)
        savehist-autosave-interval 60
        savehist-file (expand-file-name "savehist"
                                        jcazevedo/config-savefile-dir))
  :config
  (savehist-mode 1))

(use-package recentf
  :ensure t
  :init
  (setq recentf-save-file (expand-file-name "recentf"
                                            jcazevedo/config-savefile-dir)
        recentf-max-saved-items 500
        recentf-max-menu-items 15
        recentf-auto-cleanup 'never)
  (defun jcazevedo/recentf-exclude-p (file)
    (let ((file-dir (file-truename (file-name-directory file))))
      (-any-p (lambda (dir)
                (string-prefix-p dir file-dir))
              (mapcar 'file-truename
                      (list jcazevedo/config-savefile-dir package-user-dir)))))
  :config
  (add-to-list 'recentf-exclude 'jcazevedo/recentf-exclude-p)
  (add-to-list 'recentf-exclude "COMMIT_EDITMSG\\'")
  (recentf-mode 1))

(use-package windmove
  :ensure t
  :config
  (windmove-default-keybindings))

(use-package crux
  :ensure t
  :config
  (crux-with-region-or-buffer indent-region)
  (crux-with-region-or-buffer untabify)
  :bind (("C-c r" . crux-rename-file-and-buffer)
         ("C-c D" . crux-delete-file-and-buffer)))

(use-package tramp
  :ensure t
  :init
  (defun jcazevedo/file-owned-by-user-p (filename)
    (equal (nth 2 (file-attributes filename 'integer))
           (user-uid)))

  (defun jcazevedo/find-alternate-file-as-root (filename)
    (find-alternate-file (concat "/sudo:root@localhost:" filename)))

  (defun jcazevedo/reopen-as-root ()
    (unless (or (tramp-tramp-file-p buffer-file-name)
                (equal major-mode 'dired-mode)
                (not (file-exists-p (file-name-directory buffer-file-name)))
                (file-writable-p buffer-file-name)
                (jcazevedo/file-owned-by-user-p buffer-file-name))
      (jcazevedo/find-alternate-file-as-root buffer-file-name)))
  :config
  (add-hook 'find-file-hook 'jcazevedo/reopen-as-root))

(use-package super-save
  :ensure t
  :config
  (super-save-mode 1))

(use-package whitespace
  :ensure t
  :init
  (defun jcazevedo/enable-whitespace-mode ()
    (add-hook 'before-save-hook 'whitespace-cleanup nil t)
    (whitespace-mode 1))
  (add-hook 'text-mode-hook 'jcazevedo/enable-whitespace-mode)
  (add-hook 'prog-mode-hook 'jcazevedo/enable-whitespace-mode)
  (setq-default whitespace-line-column 80
                whitespace-style '(face tabs empty trailing lines-tail)))

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode 1))

(use-package anzu
  :ensure t
  :bind (("C-M-%" . anzu-query-replace-regexp)
         ("M-%" . anzu-query-replace))
  :config
  (global-anzu-mode))

(use-package smartparens
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'smartparens-mode)
  :config
  (show-smartparens-global-mode t))

(use-package projectile
  :ensure t
  :init
  (setq projectile-cache-file
        (expand-file-name  "projectile.cache" jcazevedo/config-savefile-dir))
  :config
  (projectile-global-mode 1))

(use-package helm
  :ensure t
  :demand t
  :bind (("M-x" . helm-M-x)
         ("C-x C-m" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-b" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-h f" . helm-apropos)
         ("C-h r" . helm-info-emacs)
         ("C-h C-l" . helm-locate-library)
         ("C-c f" . helm-recentf))
  :init
  (setq helm-split-window-in-side-p t
        helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-ff-search-library-in-sexp t
        helm-ff-file-name-history-use-recentf t
        helm-prevent-escaping-from-minibuffer t)
  :config
  (use-package helm-projectile
    :ensure t
    :init
    (setq projectile-completion-system 'helm
          helm-projectile-fuzzy-match t)
    :config
    (helm-projectile-on))
  (use-package helm-descbinds
    :ensure t)
  (use-package helm-ag
    :ensure t)
  (helm-autoresize-mode 1)
  (helm-descbinds-mode)
  (helm-mode 1)
  (bind-keys :map helm-map
             ("<tab>" . helm-execute-persistent-action)))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'jcazevedo-editor)
