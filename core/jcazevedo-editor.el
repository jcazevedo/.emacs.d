;; Don't use tabs to indent
(setq-default indent-tabs-mode nil)

;; Maintain correct tab appearance
(setq-default tab-width 8)

;; Require newline at end of file
(setq require-final-newline t)

;; Delete selection with a keypress
(delete-selection-mode t)

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Meaningful names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t)    ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; Use shift + arrow keys to switch between visible buffers
(require 'windmove)
(windmove-default-keybindings)

;; Highlight the current line
(global-hl-line-mode +1)

;; Tramp, for sudo access
(require 'tramp)

;; Keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")

;; Set up whitespace mode for text-mode
(defun jcazevedo-enable-whitespace ()
  (add-hook 'before-save-hook 'whitespace-cleanup nil t)
  (whitespace-mode +1))

(add-hook 'text-mode-hook 'jcazevedo-enable-whitespace)

;; Require expand-region
(require 'expand-region)

;; Require projectile
(require 'projectile)
(setq projectile-cache-file (expand-file-name "projectile.cache" jcazevedo-savefile-dir))
(projectile-global-mode t)

;; Shorter aliases for ack-and-a-half commands
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;; Always delete and copy recursively
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; Make a shell script executable automatically on save
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; Add `.zsh' to shell-script mode
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . shell-script-mode))

;; Set whitespace-mode config
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tabs empty trailing lines-tail))

;; Enable winner-mode to manage window configurations
(winner-mode +1)

(provide 'jcazevedo-editor)
