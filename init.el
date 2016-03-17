(setq load-prefer-newer t)

(defvar jcazevedo/config-dir
  (file-name-directory load-file-name))
(defvar jcazevedo/config-base-dir
  (expand-file-name "base" jcazevedo/config-dir))
(defvar jcazevedo/config-modules-dir
  (expand-file-name "modules" jcazevedo/config-dir))
(defvar jcazevedo/config-savefile-dir
  (expand-file-name "savefile" jcazevedo/config-dir))
(defvar jcazevedo/config-packages-dir
  (expand-file-name "packages" jcazevedo/config-dir))

(unless (file-exists-p jcazevedo/config-savefile-dir)
  (make-directory jcazevedo/config-savefile-dir))

(add-to-list 'load-path jcazevedo/config-base-dir)
(add-to-list 'load-path jcazevedo/config-modules-dir)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(setq package-user-dir jcazevedo/config-packages-dir)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'jcazevedo-core)
(require 'jcazevedo-ui)
(require 'jcazevedo-editor)
(require 'jcazevedo-vc)

(require 'jcazevedo-markdown)
(require 'jcazevedo-org)
(require 'jcazevedo-php)
(require 'jcazevedo-scala)
(require 'jcazevedo-yaml)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((eval ignore-errors
           (require
            (quote whitespace))
           (whitespace-mode 0)
           (whitespace-mode 1))
     (eval
      (require
       (quote whitespace))
      (whitespace-mode 0)
      (whitespace-mode 1))
     (whitespace-line-column . 120)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
