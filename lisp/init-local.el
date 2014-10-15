(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'none)
(setq ruby-insert-encoding-magic-comment nil)

(setq-default desktop-save-mode nil)
(setq-default fill-column 80)
(setq-default org-hide-leading-stars 'hidestars)
(add-hook 'text-mode-hook 'turn-on-auto-fill) ;; Set auto-fill-mode


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
(setq jabber-show-resources nil)
(setq jabber-chat-buffer-show-avatar nil)

(provide 'init-local)
