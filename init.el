;; Always load newest byte code
(setq load-prefer-newer t)

;; Set up directories
(defvar jcazevedo-dir (file-name-directory load-file-name)
  "The root directory of my .emacs.d folder.")
(defvar jcazevedo-core-dir (expand-file-name "core" jcazevedo-dir)
  "The home of my .emacs.d core functionality.")
(defvar jcazevedo-modules-dir (expand-file-name "modules" jcazevedo-dir)
  "The directory that houses all of my .emacs.d modules.")
(defvar jcazevedo-vendor-dir (expand-file-name "vendor" jcazevedo-dir)
  "The directory that houses packages that are not yet available in ELPA (or MELPA).")
(defvar jcazevedo-savefile-dir (expand-file-name "savefile" jcazevedo-dir)
  "This folder stores all the automatically generated save/history-files.")
(defvar jcazevedo-modules-file (expand-file-name "jcazevedo-modules.el" jcazevedo-dir)
  "This file contains a list of modules to be loaded.")

(unless (file-exists-p jcazevedo-savefile-dir)
  (make-directory jcazevedo-savefile-dir))

;; Add directories to Emacs's `load-path'
(add-to-list 'load-path jcazevedo-core-dir)
(add-to-list 'load-path jcazevedo-modules-dir)
(add-to-list 'load-path jcazevedo-vendor-dir)

;; Require the core stuff
(require 'jcazevedo-packages)
(require 'jcazevedo-ui)
(require 'jcazevedo-core)
(require 'jcazevedo-editor)
(require 'jcazevedo-global-keybindings)

;; Require OSX specific settings
(when (eq system-type 'darwin)
  (require 'jcazevedo-osx))

;; Require the modules
(when (file-exists-p jcazevedo-modules-file)
  (load jcazevedo-modules-file))
