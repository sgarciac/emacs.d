(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'none)
(setq ruby-insert-encoding-magic-comment nil)

(setq-default desktop-save-mode nil)
(setq-default fill-column 80)
(setq-default org-hide-leading-stars 'hidestars)
(setq auto-indent-start-org-indent t)
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; Set auto-fill-mode
(add-hook 'html-erb-mode-hook 'turn-off-auto-fill)

;; some crap to fix a pasteboard problem in mac:
(when (eq window-system 'ns)
  (defadvice ns-get-pasteboard (around hack-empty-pasteboard compile activate)
    (condition-case err
        ad-do-it
      (quit (message "%s" (cadr err))
            nil))))


(setq jabber-account-list
      '(("sergio@demarque.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl)
         (:port . 443)
         (:password)
         )
        ("sagc@gozque.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl)
         (:port . 443))
        ))

(setq jabber-auto-reconnect t)
(setq jabber-roster-line-format "  %c %-25n %u %-8s ")
(setq jabber-roster-show-bindings nil)
(setq jabber-roster-show-title nil)
(setq jabber-show-resources t)
(setq jabber-chat-buffer-show-avatar nil)
(add-hook 'jabber-post-connect-hooks 'jabber-autoaway-start)
(set-face-attribute 'default nil :height 140)

(provide 'init-local)
