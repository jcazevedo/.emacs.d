(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)
(blink-cursor-mode -1)
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode 1)

(setq inhibit-startup-screen 1
      scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(fset 'yes-or-no-p 'y-or-n-p)

(defun jcazevedo/fullscreen ()
  (interactive)
  (cond
   ((eq system-type 'darwin)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
   ((eq window-system 'x)
    (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                           '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
   (error "Unable to toggle fullscreen")))

(global-set-key (kbd "<f11>") 'jcazevedo/fullscreen)

(defvar jcazevedo/default-font "Menlo-12")
(set-face-attribute 'default nil :font jcazevedo/default-font)
(set-frame-font jcazevedo/default-font nil t)

(use-package zenburn-theme
  :ensure t
  :init
  (when (fboundp 'fringe-mode)
    (fringe-mode '(4 . 0)))
  (set-face-attribute 'vertical-border
                      nil
                      :foreground "#4F4F4F"))

(use-package linum
  :ensure t
  :init
  (defun jcazevedo/enable-linum-mode ()
    (linum-mode 1))
  (add-hook 'text-mode-hook 'jcazevedo/enable-linum-mode)
  (add-hook 'prog-mode-hook 'jcazevedo/enable-linum-mode)
  (add-hook 'linum-before-numbering-hook
            (lambda ()
              (setq-local linum-format-fmt
                          (let ((w (length (number-to-string
                                            (count-lines (point-min) (point-max))))))
                            (concat "  %" (number-to-string w) "d ")))))
  (defun linum-format-func (line)
     (propertize (format linum-format-fmt line) 'face 'linum))
  :config
  (setq linum-format 'linum-format-func)
  (set-face-attribute 'linum
                      nil
                      :height 0.8
                      :weight 'light))

(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme 1)
  :config
  (setq sml/theme nil)
  (sml/setup)
  (set-face-attribute 'mode-line
                      nil
                      :box '(:line-width 8 :color "#2B2B2B"))
  (set-face-attribute 'mode-line-inactive
                      nil
                      :box '(:line-width 8 :color "#383838")))

(provide 'jcazevedo-ui)
