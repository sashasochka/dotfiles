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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
