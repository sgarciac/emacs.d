;;; package -- my local init
;;; Commentary:
;;; Nothing really

;;; Code:
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
(setq-default preferred-javascript-indent-level 2)
(setq-default typescript-indent-level 2)

;; fix a pasteboard problem in mac:
(when (eq window-system 'ns)
  (defadvice ns-get-pasteboard (around hack-empty-pasteboard compile activate)
    (condition-case err
        ad-do-it
      (quit (message "%s" (cadr err))
            nil))))


(defun setup-tide-mode ()
  "Setup the tide mode."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (prettier-js-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)

  ;; formats the buffer before saving
  ;; WE USE PRETTIER-JS INSTEAD
  ;;(add-hook 'before-save-hook 'tide-format-before-save)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(eval-after-load "tide"
  '(define-key tide-mode-map (kbd "C-!") 'tide-fix))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)


(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes

(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

                                        ;(flycheck-add-mode 'typescript-tslint 'ng2-ts-mode)
                                        ;(flycheck-add-mode 'typescript-tide 'ng2-ts-mode)

(setq yas-snippet-dirs '("~/dev/ng2-ts-snippets/snippets"))
(yas-global-mode 1)


(with-eval-after-load 'tide
  (flycheck-add-mode 'typescript-tslint 'ng2-ts-mode)
  (flycheck-add-mode 'typescript-tide 'ng2-ts-mode)
  )

(defun my-go-mode-hook ()
  "Go setup."
  (setq tab-width 2 indent-tabs-mode 1)
  (local-set-key (kbd "M-.") #'godef-jump)
  (add-hook 'before-save-hook 'gofmt-before-save)
  )

(add-hook 'go-mode-hook 'my-go-mode-hook)

(provide 'init-local)
;;; init-local ends here
