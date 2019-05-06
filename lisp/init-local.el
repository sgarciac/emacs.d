;;; package -- my local init
;;; Commentary:
;;; Nothing really

;;; Code:
(package-install 'use-package)
(require 'use-package)

(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'none)
(setq ruby-insert-encoding-magic-comment nil)
(setq echo-keystrokes .1)
(setq-default desktop-save-mode nil)
(setq-default fill-column 80)
(setq-default org-hide-leading-stars 'hidestars)
(setq auto-indent-start-org-indent t)
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; Set auto-fill-mode
(add-hook 'html-erb-mode-hook 'turn-off-auto-fill)
;; (setq-default preferred-javascript-indent-level 2)
(setq-default typescript-indent-level 2)

;; fix a pasteboard problem in mac:
(when (eq window-system 'ns)
  (defadvice ns-get-pasteboard (around hack-empty-pasteboard compile activate)
    (condition-case err
        ad-do-it
      (quit (message "%s" (cadr err))
            nil))))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(setq yas-snippet-dirs '("~/dev/ng2-ts-snippets/snippets"))
(yas-global-mode 1)

(use-package prettier-js
	:ensure t)

(use-package emmet-mode
  :ensure t
  :hook (sgml-mode css-mode))

(defun setup-tide-mode ()
	"Setting up tide."
	(interactive)
	(tide-setup)
	(flycheck-mode +1)
	(prettier-js-mode +1)
	(eldoc-mode +1)
	(tide-hl-identifier-mode +1)
	(company-mode +1)
	)

(use-package tide
  :ensure t
	:after (init-flycheck init-company prettier-js)
	:custom (flycheck-check-syntax-automatically '(save mode-enabled))
	:bind (("C-!" . tide-fix))
  :hook ((typescript-mode . setup-tide-mode))
	)

(use-package go-mode
  :ensure t
  :custom
  (tab-width 2)
  (indent-tabs-mode 1)
  :bind (("M-." . godef-jump))
  :hook go-mode-hook
	:init (add-hook 'before-save-hook #'gofmt-before-save)
  )

(provide 'init-local)
;;; init-local ends here
