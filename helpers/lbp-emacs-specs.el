(require 'nxml-mode)

(defun lbp-setup ()
  ;; Required settings for style guide compliance
  (setq indent-tabs-mode nil)
  (setq nxml-child-indent 2)
  (setq nxml-attribute-indent 2)

  ;; Optional settings
  (setq nxml-slash-auto-complete-flag t))

(add-hook 'nxml-mode-hook 'lbp-setup)
