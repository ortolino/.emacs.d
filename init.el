;; This is my emacs init file. I hope I can keep it as long as I can and configure it to my likings
(require 'package)
(require 'use-package)
;; Add MELPA repository for additional packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;(package-refresh-contents)

;; INTERFACE: change the visual style and the management of the interface

;; Setup visual theme
(load-theme 'modus-vivendi)

;; Setup vertico for improved search interface
(use-package vertico
  :ensure t
  :init (vertico-mode))


;; Setup marginalia for additional informations in minibuffer
(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init (marginalia-mode))

;; Setup consult for additional buffer actions
(use-package consult
  :ensure t)


;; PROGRAMMING: setup all main programming languages

;; Set spaces instead of tabs:
(setq-default indent-tabs-mode t)
(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide

;; Git: install magit for git management
(use-package magit
  :ensure t)
(require 'magit)

;; HTML: set of rules for HTML

;; LSP: for the moment I will use the lighter eglot, will see if I need the beefier lsp-mode
(use-package eglot
  :ensure t)

;; Variables AND FACES: added automatically by Emacs

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((lean4-mode :url
				 "https://github.com/leanprover-community/lean4-mode.git")))
 '(safe-local-variable-values
   '((eval add-hook 'before-save-hook #'whitespace-cleanup nil t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
