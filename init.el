;; This is my emacs init file. I hope I can keep it as long as I can and configure it to my likings
(require 'package)
(require 'use-package)
;; Add MELPA repository for additional packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; INTERFACE: change the visual style and the management of the interface

;; Setup visual theme
(load-theme 'modus-vivendi)

;; PROGRAMMING: setup all main programming languages

;; Git: install magit for git management
(use-package magit
  :ensure t)
(require 'magit)






;; VARIABLES AND FACES: added automatically by Emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(dash: lean4-mode lsp-mode magit t2))

 '(safe-local-variable-values
   '((eval add-hook 'before-save-hook #'whitespace-cleanup nil t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
