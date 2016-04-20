(use-package ruby-mode
  :ensure t
  :mode "\\.rake\\'" "Rakefile\\'" "\\.gemspec\\'" "\\.ru\\'" "Gemfile\\'"
  "Guardfile\\'" "Capfile\\'" "\\.cap\\'" "\\.thor\\'" "\\.rabl\\'"
  "Thorfile\\'" "Vagrantfile\\'" "\\.jbuilder\\'" "Podfile\\'" "\\.podspec\\'"
  "Puppetfile\\'" "Berksfile\\'" "Appraisals\\'"
  :init
  (add-to-list 'completion-ignored-extensions ".rbc")
  :config
  (use-package inf-ruby
    :ensure t)
  (use-package ruby-tools
    :ensure t)
  (use-package yari
    :ensure t)
  (add-hook 'ruby-mode-hook (lambda ()
                              (inf-ruby-minor-mode +1)
                              (ruby-tools-mode +1)
                              (subword-mode +1))))

(use-package rvm
  :ensure t
  :config
  (rvm-use-default))

(provide 'jcazevedo-ruby)
