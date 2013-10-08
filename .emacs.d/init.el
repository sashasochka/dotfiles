;; Setup Emacs package archives
(require 'package)
(add-to-list 'package-archives' ("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Setup Ctrl+C in copy mode
(setq x-select-enable-clipboard t)

;; Setup indent
(setq-default c-basic-offset 4)
(setq-default indent-tabs-mode nil)

;; Setup env variables
(setenv "PAGER" "/bin/cat")

;; Setup email settings
;; Rmail
(setenv "MAILHOST" "pop.gmail.com")
(setq rmail-primary-inbox-list '("op:sasha.sochka")
      rmail-pop-password-required t)
