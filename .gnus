;; Taken from http://www.emacswiki.org/cgi-bin/wiki/GnusGmail

;; Put the following into the ~/.authinfo file
;; Replace "user" with your username and "password" with your actual password
;; machine imap.gmail.com login user@gmail.com password secret port 993
;; machine smtp.gmail.com login user@gmail.com password secret port 587
(setq gnus-select-method
      '(nnimap "gmail"
	       (nnimap-address "imap.gmail.com")
	       (nnimap-server-port 993)
	       (nnimap-stream ssl)))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587
				   "sasha.sochka@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
