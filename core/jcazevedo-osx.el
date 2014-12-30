(defun jcazevedo/toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(global-set-key (kbd "<f11>") 'jcazevedo/toggle-fullscreen)

(provide 'jcazevedo-osx)
