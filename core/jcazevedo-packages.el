(require 'cl)
(require 'package)

;; Add Melpa as package source
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Set package-user-dir to be relative to my .emacs.d
(setq package-user-dir (expand-file-name "elpa" jcazevedo/dir))
(package-initialize)

(defvar jcazevedo/packages
  '(diff-hl
    expand-region
    git-timemachine
    know-your-http-well
    magit
    paradox
    projectile
    smartparens
    zenburn-theme))

(defun jcazevedo/packages-installed-p ()
  "Check if all packages in `jcazevedo/packages' are installed."
  (every #'package-installed-p jcazevedo/packages))

(defun jcazevedo/require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package jcazevedo/packages)
    (add-to-list 'jcazevedo/packages package))
  (unless (package-installed-p package)
    (package-install package)))

(defun jcazevedo/require-packages (packages)
  "Ensure PACKAGES are installed.
Missing packages are installed automatically."
  (mapc #'jcazevedo/require-package packages))

(defun jcazevedo/install-packages ()
  "Install all packages listed in `jcazevedo/packages'."
  (unless (jcazevedo/packages-installed-p)
    ;; check for new packages (package versions)
    (package-refresh-contents)
    ;; install the missing packages
    (jcazevedo/require-packages jcazevedo/packages)))

;; Run package installation
(jcazevedo/install-packages)

(provide 'jcazevedo-packages)
