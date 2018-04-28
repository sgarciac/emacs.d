(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'none)
(setq ruby-insert-encoding-magic-comment nil)

(setq-default desktop-save-mode nil)
(setq-default fill-column 80)
(setq-default org-hide-leading-stars 'hidestars)
(setq auto-indent-start-org-indent t)
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; Set auto-fill-mode
(add-hook 'html-erb-mode-hook 'turn-off-auto-fill)

;; fix a pasteboard problem in mac:
(when (eq window-system 'ns)
  (defadvice ns-get-pasteboard (around hack-empty-pasteboard compile activate)
    (condition-case err
        ad-do-it
      (quit (message "%s" (cadr err))
            nil))))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes

(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(provide 'init-local)
